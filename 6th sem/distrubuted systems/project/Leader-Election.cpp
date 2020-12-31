#include <algorithm>
#include <arpa/inet.h>
#include <assert.h>
#include <climits>
#include <fstream>
#include <iostream>
#include <map>
#include <mutex>
#include <netinet/in.h>
#include <pthread.h>
#include <sstream>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <time.h>
#include <unistd.h>
#include <utility>
#include <vector>


#define DEBUG_MODE 1
#define MAX_MSG_LEN 500
#define INF -1

using namespace std;
enum State { DV = 1, BULLY = 2 };
enum Bully_msg_type { ALIVE, VICTORY };

void sendMsg(std::string msg, int destination_pid);

struct nodeInfo {
  int id, total_nodes;
  vector<int> neighbour_ids;
  vector<pair<int, vector<pair<int, int>>>>
      dv_table; // contains selfloop too with cost 0
  int bVal;
  int weight;
  int leader_weight; // count if more than one leaders
  bool victory_sent_flag = false;
  vector<int> leader_pids;
  State state;
};

struct Decoder {
  int proc_id;
  State state;
  vector<pair<int, int>> dv_row;
  int weight, other_pid; // For bully message
  Bully_msg_type bully_msg_type;
};

const string PROC_DELIMITER = "-";
const string GEN_DELIMITER = "|"; // general
const string COST_DELIMITER = "#";

// global variables
int number_of_nodes, MAXPENDING, beginLock = 0;
pthread_cond_t sendBeginCondVariable;
pthread_mutex_t sendLock;
std::mutex write_lock;

// convert the message to dv_table
Decoder decode_message(char msg[], int size) {
  Decoder decoder;
  string encoded(msg);

  // find the process id
  int pos_proc_end = encoded.find(PROC_DELIMITER);
  if (pos_proc_end == string::npos) {
    cerr << "Invalid string received: " << msg << endl;
    exit(-1);
  }
  try {
    decoder.proc_id = stoi(encoded.substr(0, pos_proc_end));
    encoded.erase(0, pos_proc_end + PROC_DELIMITER.length());
  } catch (std::invalid_argument const &e) {
    cerr << "Encoded message is invalid(process id): " << msg << endl;
    exit(-1);
  }

  // find the State
  int pos_state_end = encoded.find(GEN_DELIMITER);
  if (pos_state_end == string::npos) {
    cerr << "Invalid string received: " << msg << endl;
    exit(-1);
  }
  try {
    decoder.state = static_cast<State>(stoi(encoded.substr(0, pos_state_end)));
    encoded.erase(0, pos_state_end + GEN_DELIMITER.length());
  } catch (std::invalid_argument const &e) {
    cerr << "Encoded message is invalid(state): " << e.what() << " : "
         << encoded << endl;
    exit(-1);
  }

  if (decoder.state == DV) {

    // get the neighbour ids row
    int pos, pos_cost;
    while (((pos = encoded.find(COST_DELIMITER)) != std::string::npos) &&
           ((pos_cost = encoded.find(GEN_DELIMITER)) != std::string::npos) &&
           pos < pos_cost) {
      try {
        pair<int, int> cell(stoi(encoded.substr(0, pos)), 0);
        decoder.dv_row.push_back(cell);
        encoded.erase(0, pos + COST_DELIMITER.length());
      } catch (std::invalid_argument const &e) {
        write_lock.lock();
        cerr << pos
             << " Encoded message is invalid(neighbour ids): " << e.what()
             << " : " << encoded << endl;
        write_lock.unlock();
        exit(-1);
      }
    }

    // remove the delimiter between ids and costs
    pos = encoded.find(GEN_DELIMITER);
    if (pos == string::npos) {
      cerr << "Invalid string received: " << msg << endl;
      exit(-1);
    }
    encoded.erase(0, GEN_DELIMITER.length());

    // get the costs row
    int index = 0;
    while ((pos = encoded.find(COST_DELIMITER)) != std::string::npos) {
      try {
        decoder.dv_row[index++].second = stoi(encoded.substr(0, pos));
        encoded.erase(0, pos + COST_DELIMITER.length());
      } catch (std::invalid_argument const &e) {
        cerr << "Encoded message is invalid(Costs): " << msg << endl;
        exit(-1);
      }
    }
  } else {
    std::replace(encoded.begin(), encoded.end(), '|', ' ');
    std::stringstream encodedmsg(encoded);
    std::string msg_type;
    encodedmsg >> msg_type;
    if (msg_type == "ALIVE") {
      encodedmsg >> decoder.weight >> decoder.other_pid;
      decoder.bully_msg_type = ALIVE;
    }
  }

  return decoder;
}

int getIndex(vector<pair<int, vector<pair<int, int>>>> &dv_table, int key) {
  for (int i = 0; i < dv_table.size(); i++) {
    if (dv_table[i].first == key)
      return i;
  }
  return -1;
}

int getIndex(vector<pair<int, int>> &dv_table_row, int key) {
  for (int i = 0; i < dv_table_row.size(); i++) {
    if (dv_table_row[i].first == key)
      return i;
  }
  return -1;
}

bool isRecalculateRequired(vector<pair<int, int>> dv_row,
                           vector<pair<int, int>> new_row) {
  // is size equal?
  if (dv_row.size() != new_row.size())
    return true;
  // sort both of them according to neighbour id and then compare both arrays.
  sort(dv_row.begin(), dv_row.end());
  sort(new_row.begin(), new_row.end());

  for (int i = 0; i < dv_row.size(); i++) {
    if (dv_row[i].first != new_row[i].first ||
        dv_row[i].second != new_row[i].second)
      return true;
  }

  return false;
}

int findCost(vector<pair<int, int>> dv_row, int key) {
  for (int i = 0; i < dv_row.size(); i++) {
    if (dv_row[i].first == key)
      return dv_row[i].second;
  }
  return INF;
}

void print_dv_table(int id,
                    vector<pair<int, vector<pair<int, int>>>> &dv_table) {
  cout << "dv_table start for: " << id << endl;
  for (int i = 0; i < dv_table.size(); i++) {
    cout << "id: " << dv_table[i].first << endl;
    cout << "Neighbour "
         << "Cost (-1 = INF)" << endl;
    for (int j = 0; j < dv_table[i].second.size(); j++) {
      cout << dv_table[i].second[j].first << " ";
      cout << dv_table[i].second[j].second << endl;
    }
  }
  cout << "dv_table ends" << endl;
}

// thread to receive messages in a node
void *receiveThread(void *params) {
  // this struct contains information about the node
  nodeInfo *ni = (nodeInfo *)params;
  // id of the server
  int selfID = ni->id;
  // the port number is associated with the server id
  in_port_t servPort = 55000 + selfID; // Local port

  int servSock;
  if ((servSock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) {
    perror("socket() failed");
    exit(-1);
  }

  struct sockaddr_in servAddr;
  memset(&servAddr, 0, sizeof(servAddr));
  servAddr.sin_family = AF_INET;
  servAddr.sin_addr.s_addr = htonl(INADDR_ANY);
  servAddr.sin_port = htons(servPort);

  // Bind to the local address
  if (bind(servSock, (struct sockaddr *)&servAddr, sizeof(servAddr)) < 0) {
    perror("bind() failed");
    exit(-1);
  }

  // Listen to the client
  if (listen(servSock, MAXPENDING) < 0) {
    perror("listen() failed");
    exit(-1);
  }

  // this lock ensures that no sender thread begins sending sync requests
  // before all the server are ready to listen
  pthread_mutex_lock(&sendLock);
  beginLock++;
  if (beginLock == number_of_nodes)
    // signalling all the sending threads that the
    // receiving threads are ready and listening
    pthread_cond_broadcast(&sendBeginCondVariable);
  pthread_mutex_unlock(&sendLock);

#ifndef DEBUG_MODE
  cout << "Process now listening " << selfID << endl;
#endif

  // The receiving threads will read the message and check its type
  // if of type DV they will update their local vector after looking
  // at the message, else if the type if of bully it will compare with
  // its own bully value and do as required
  while (true) {
    // listen loop
    for (auto i = 0;; i++) {
      if (listen(servSock, MAXPENDING) < 0) {
        perror("listen() failed");
        exit(-1);
      }
      struct sockaddr_in clntAddr;
      socklen_t clntAddrLen = sizeof(clntAddr);

#ifndef DEBUG_MODE
      cout << "Waiting for accept" << endl;
#endif

      int clntSock =
          accept(servSock, (struct sockaddr *)&clntAddr, &clntAddrLen);
      if (clntSock < 0) {
        perror("accept() failed");
        exit(-1);
      }
      char clntIpAddr[INET_ADDRSTRLEN];
      if (inet_ntop(AF_INET, &clntAddr.sin_addr.s_addr, clntIpAddr,
                    sizeof(clntIpAddr)) != NULL) {
        // printf("----\nHandling client %s %d\n", clntIpAddr,
        // ntohs(clntAddr.sin_port));
      } else {
        puts("----\nUnable to get client IP Address");
      }

      // Receive data
      char buffer[MAX_MSG_LEN];
      memset(buffer, 0, sizeof(char) * MAX_MSG_LEN);
      ssize_t recvLen = recv(clntSock, buffer, sizeof(char) * MAX_MSG_LEN, 0);
      Decoder decoder = decode_message(buffer, strlen(buffer));
      if (decoder.state == DV) { // Process DV message
        // process the costs from receiver
        // find the row in dv_table
        int idx_inc = getIndex(ni->dv_table,
                               decoder.proc_id); // incoming node index in table
        if (idx_inc == -1) {
          cerr << "Invalid string received(index not found in table)" << endl;
          exit(-1);
        }
        // recalculate distance vector if needed
        if (isRecalculateRequired(ni->dv_table[idx_inc].second,
                                  decoder.dv_row)) {
          int id = ni->id;
          // save this distance info to dv_table
          ni->dv_table[idx_inc].second = decoder.dv_row;
          // recalculate the distance vector - same neighbour set
          int idx_id = getIndex(ni->dv_table, id); // curr node index in table
          int k =
              getIndex(ni->dv_table[idx_id].second,
                       decoder.proc_id); // inc vertex index in forwarding table
          for (int j = 0; j < ni->dv_table[idx_id].second.size(); j++) {
            // dv_table[idx_id] is the current forwarding table of the node.
            if (ni->dv_table[idx_id].second[j].first == id ||
                ni->dv_table[idx_id].second[j].first ==
                    decoder.proc_id) // same node cost 0, recv node self loop 0,
                                     // so ignore that too
              continue;
            // find the min cost
            // Ex: X -> Z = min(X->Z, X -> Y -> Z)
            // idx_id is X, Y is k, Z is j. (k here is incoming vertex)
            int minim = ni->dv_table[idx_id]
                            .second[j]
                            .second; // base is the known cost.
            // check via incoming dv_row vertex
            int inter_cost = findCost(
                ni->dv_table[idx_inc].second,
                ni->dv_table[idx_id]
                    .second[j]
                    .first); // YZ cost where arg1 is row(of Y), arg2 is Z's id
            if (k != -1 && ni->dv_table[idx_id].second[k].second != INF &&
                inter_cost != INF) { // can do update operation
              if (minim == INF)
                minim = ni->dv_table[idx_id].second[k].second + inter_cost;
              else
                minim = min(minim,
                            ni->dv_table[idx_id].second[k].second +
                                inter_cost); // XZ, XY + YZ
              ni->dv_table[idx_id].second[j].second = minim;
            }
          }
        }
        // #ifndef DEBUG_MODE
        //   write_lock.lock();
        //   print_dv_table(ni->id, ni->dv_table);
        //   write_lock.unlock();
        // #endif
      } else if (decoder.state == BULLY) { // Process Bully message
        int id = ni->id;
        int idx_id = getIndex(ni->dv_table, id); // curr node index in table

#ifndef DEBUG_MODE
        printf("BULLY: %d recv weight from %d (%d)\n", selfID,
               decoder.other_pid, decoder.weight);
#endif
        if (decoder.weight > ni->leader_weight) {
#ifndef DEBUG_MODE
          printf("BULLY: %d decided %d as leader pid\n", selfID,
                 decoder.other_pid);
#endif
          ni->leader_weight = decoder.weight;
          ni->leader_pids = vector<int>({decoder.other_pid});
        } else if (decoder.weight == ni->leader_weight) {
#ifndef DEBUG_MODE
          printf("BULLY: %d decided to ADD %d to leader pid\n", selfID,
                 decoder.other_pid);
#endif
          ni->leader_pids.push_back(decoder.other_pid);
        }
      }
#ifndef DEBUG_MODE
      cout << "Received by Process " << selfID << " " << buffer << endl;
#endif
      close(clntSock);
    }
  }
}

// encode table into a string in the format
// <Proc-id>-<State>|<num>#<num>#..<num>#|<num>#<num>#..<num># Second part is
// Neighbour list, third part is cost list
std::string encode_table(int id, vector<int> &node_ids, vector<int> &dv_row) {
  string encode = to_string(id) + "-" + to_string(DV) + "|";

  for (int i = 0; i < node_ids.size(); i++)
    encode += to_string(node_ids[i]) + "#";

  encode += "|";

  for (int i = 0; i < dv_row.size(); i++)
    encode += to_string(dv_row[i]) + "#";

#ifndef DEBUG_MODE
  write_lock.lock();
  cout << "the sender msg: " << encode << " : " << endl;
  write_lock.unlock();
#endif

  return encode;
}

vector<int> getNodeIds(vector<pair<int, vector<pair<int, int>>>> &dv_table) {
  vector<int> node_ids;
  for (int i = 0; i < dv_table.size(); i++) {
    node_ids.push_back(dv_table[i].first);
  }
  return node_ids;
}

vector<vector<int>>
getStaticTable(vector<pair<int, vector<pair<int, int>>>> &dv_table) {
  vector<vector<int>> local_dv_table;
  for (int i = 0; i < dv_table.size(); i++) {
    vector<int> dv_row;
    for (int j = 0; j < dv_table[i].second.size(); j++) {
      dv_row.push_back(dv_table[i].second[j].second);
    }
    local_dv_table.push_back(dv_row);
  }
  return local_dv_table;
}

void sendMsg(std::string msg, int destination_pid) {

  in_port_t servPort;
  // local host
  char servIP[10] = "127.0.0.1";
  struct sockaddr_in servAddr;
  memset(&servAddr, 0, sizeof(servAddr));
  servAddr.sin_family = AF_INET;
  int err = inet_pton(AF_INET, servIP, &servAddr.sin_addr.s_addr);
  if (err <= 0) {
    perror("inet_pton() failed");
    exit(-1);
  }

  int sockfd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
  if (sockfd < 0) {

#ifndef DEBUG_MODE
    cout << "socket creation failed" << endl;
#endif

    perror("socket() failed");
    exit(-1);
  }

  servPort = 55000 + destination_pid;
  servAddr.sin_port = htons(servPort);
  // connect to the server
  while (true) {
    if (connect(sockfd, (struct sockaddr *)&servAddr, sizeof(servAddr)) < 0) {
      perror("connect() failed");
      // exit(-1);
    } else
      break;
  }
  ssize_t sentLen = send(sockfd, msg.c_str(), msg.length(), 0);
  if (sentLen < 0) {
    perror("send() failed");
    exit(-1);
  } else if (sentLen != msg.length()) {
    perror("send(): sent unexpected number of bytes");
    exit(-1);
  }
  close(sockfd);
}

// threads which simulate nodes in a network
void *nodeProcess(void *params) {
  // this struct contains information about the node
  nodeInfo *ni = (nodeInfo *)params;
  // id of the server
  int selfID = ni->id;

  // the message which is sent to neighbour nodes
  char msg[MAX_MSG_LEN] = "servermsg";

  // each cell process has a seperate receiving thread
  pthread_t receivingThread;
  pthread_create(&receivingThread, NULL, receiveThread, (void *)ni);

  // using conditional variable to wait for the all receiving
  // threads to become active
  pthread_mutex_lock(&sendLock);
  pthread_cond_wait(&sendBeginCondVariable, &sendLock);
  pthread_mutex_unlock(&sendLock);

#ifndef DEBUG_MODE
  cout << "Server Process Begin: " << selfID << endl;
#endif

  // DV Computation
  // all messages should have the type of messages in the beginning
  // so that we can differentiate between DV messages and Bully messages
  // after the type the data can follow

  // this is the loop for sending DV messages, iteration is happening
  // only once over all neighbours but ideally it would be k times
  // over all neighbours
  // the messages here should something like:
  // type|senderID|neighbours vector
  //

  int count = 4;
  for (auto t = 0;; t++) {
    if (count > 0) {
      vector<int> node_ids = getNodeIds(ni->dv_table);
      vector<int> neighbour_ids = ni->neighbour_ids;
      int idx_id = getIndex(ni->dv_table, selfID);
      vector<vector<int>> local_dv_table =
          getStaticTable(ni->dv_table); // will have costs of table
      for (auto i = 0; i < neighbour_ids.size(); i++) {
        // no need to send to self
        if (neighbour_ids[i] == ni->id)
          continue;
        // send to neighbours
        sendMsg(encode_table(ni->id, node_ids, local_dv_table[idx_id]),
                neighbour_ids[i]);
      }
      // sleep for sometime, so neighbours have time to update
      // their DVs
      usleep(5e5);
      count--;
    } else {
      // BULLY;
      count = 4;
      // SEND ONCE
      int selfIndex = getIndex(ni->dv_table, selfID);

      // CALCULATE MY WEIGHT
      int sum = 0, num_values = 0;
      auto table = ni->dv_table[selfIndex].second;
      for (int i = 0; i < table.size(); i++) {
        if (table[i].second == INF)
          continue;
        sum += table[i].second;
        num_values++;
      }

      int weight = num_values * 1000 / sum;
#ifndef DEBUG_MODE
      printf("%d : %d\n", selfID, weight);
#endif
      ni->weight = weight;
      ni->leader_weight = weight;
      ni->leader_pids = vector<int>({selfID});

      usleep(5e5);

      for (int i = 0; i < ni->dv_table.size(); i++) {
        if (i == selfIndex)
          continue;
        sendMsg(to_string(selfID) + PROC_DELIMITER + to_string(BULLY) +
                    GEN_DELIMITER + "ALIVE" + GEN_DELIMITER +
                    to_string(weight) + GEN_DELIMITER + to_string(selfID),
                ni->dv_table[i].first);
      }

      usleep(5e5); // wait for others to recv and choose leader

#ifndef DEBUG_MODE
      printf("%d says %ld leaders\n", selfID, ni->leader_pids.size());
#endif

      // Choose the minimum and make new vector of pids (dont need vector
      // anymore but just for consistency)
      ni->leader_pids = vector<int>(
          {*min_element(ni->leader_pids.begin(), ni->leader_pids.end())});

      assert(ni->leader_pids.size() == 1 &&
             "More than one leaders - ambigous for thread");

      // The first and only element in the leader_pids is the leader
      printf("BULLY: Node %d sets %d as the leader\n", selfID, ni->leader_pids[0]);
    }
  }
  pthread_cancel(receivingThread);

  return NULL;
}

vector<int> getNodeIds(vector<vector<int>> &node_edges) {
  vector<int> node_ids;
  for (int i = 0; i < node_edges.size(); i++) {
    node_ids.push_back(node_edges[i][0]);
  }
  return node_ids;
}

vector<int> getNeighbourIds(vector<int> &node_ids, vector<int> &node_edge) {
  vector<int> neighbour_ids;
  for (int i = 0; i < node_ids.size(); i++) {
    if (node_edge[i + 1] != INF)
      neighbour_ids.push_back(node_ids[i]);
  }
  return neighbour_ids;
}

vector<pair<int, int>> fillNeighbourCosts(vector<int> &node_edge,
                                          vector<int> &node_ids) {
  vector<pair<int, int>> dv_row;
  for (int i = 0; i < node_ids.size(); i++) {
    pair<int, int> cell(
        node_ids[i],
        node_edge[i + 1]); // first node_edge value is id. rest are costs
    dv_row.push_back(cell);
  }
  return dv_row;
}

int main() {

  pthread_mutex_init(&sendLock, NULL);
  pthread_cond_init(&sendBeginCondVariable, NULL);

  ifstream input;

  input.open("input.txt");

  input >> number_of_nodes;
  MAXPENDING = number_of_nodes;

  vector<pthread_t> threadsList(number_of_nodes);
  vector<nodeInfo> node_info_list(number_of_nodes);

  vector<vector<int>> node_edges;
  for (int i = 0; i < number_of_nodes; i++) {
    int id, cost;
    vector<int> node_edge;
    // read weighted graph from file and load here
    // we only send a nodes' neighbour info not the whole topology
    input >> id;
    node_edge.push_back(id);
    for (int j = 0; j < number_of_nodes; j++) {
      input >> cost;
      node_edge.push_back(cost);
    }
    node_edges.push_back(node_edge);
  }

  // node ids
  vector<int> node_ids = getNodeIds(node_edges);

  // launch the threads
  for (int i = 0; i < number_of_nodes; i++) {
    node_info_list[i].id = node_edges[i][0];
    node_info_list[i].total_nodes = number_of_nodes;
    node_info_list[i].neighbour_ids = getNeighbourIds(node_ids, node_edges[i]);

    // initialize local dv_table
    // template dv_row
    vector<pair<int, int>> dv_row; // -1 to represent INF
    for (int j = 0; j < number_of_nodes; j++) {
      pair<int, int> cell(node_ids[j], INF);
      dv_row.push_back(cell);
    }

    for (int j = 0; j < number_of_nodes; j++) {
      pair<int, vector<pair<int, int>>> cell(node_ids[j], dv_row);
      node_info_list[i].dv_table.push_back(cell);
    }

    // fill its own neighbour details
    int local_idx = getIndex(node_info_list[i].dv_table, node_info_list[i].id);
    node_info_list[i].dv_table[local_idx].second =
        fillNeighbourCosts(node_edges[i], node_ids);
    // state
    node_info_list[i].state = DV;
    // #ifndef DEBUG_MODE
    //   print_dv_table(node_info_list[i].id, node_info_list[i].dv_table);
    // #endif
    pthread_create(&(threadsList[i]), NULL, nodeProcess,
                   (void *)(&node_info_list[i]));
  }
  input.close();

  // waiting for 4 seconds but actually this waiting for leader election
  // will be done using cond variable
  sleep(100);

  for (auto i = 0; i < number_of_nodes; i++) {
    pthread_cancel(threadsList[i]);
  }

  return 0;
}
