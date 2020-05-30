/*
author: Sai Harsha Kottapalli
About: assignment for distributed computing. Check ReadMe for instructions.
 */
#include <iostream>
#include <algorithm>
#include <iterator>
#include <cstdio>
#include <fstream>
#include <sstream>
#include <vector>
#include <utility>
#include <ctime>
#include <cmath>
#include <chrono>
#include <random> // exp_dist
#include <cstdlib> // EXIT_FAILURE
#include <cstring>
#include <thread>
#include <atomic>
#include <mutex>
#include <condition_variable>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <fcntl.h> // for open
#include <unistd.h> // for close
#include <iomanip>

#define BUFSIZE 1024

using namespace std;

// output files
ofstream log_file;
std::mutex write_lock;
std::mutex end_lock;
int listenDone = 0;
mutex* local_clock_mut;
default_random_engine generator(chrono::high_resolution_clock::to_time_t(chrono::high_resolution_clock::now())); // seed it
timespec start_time;

//structure to parse incoming data
struct parsedData {
  int channel;
  string msg;
};

// helper function to obtain time in HH:MM:SS syntax from the obtained time parameter.
string currTime() {
  timespec curr_time;
  if(clock_gettime(CLOCK_REALTIME, &curr_time) == -1 ) {
    cerr << "clock_gettime failed" << endl;
    exit( EXIT_FAILURE );
  }
  return to_string(curr_time.tv_sec - start_time.tv_sec) + ":" + to_string(curr_time.tv_nsec);
}

class TS {
  private:
    int total, id, state, t_children, t_term, parent; // id -> thread identifier, total -> total servers, state -> 0=white, 1= red, 2= blue
    // t_children is total tokens it should be recving, t_term is how many it currently recved
    bool root, sent, dt; // true is black (token_colour)
    double p, q, lam_red_wait, lam_blue_wait, lam_send; // parameters ass described in input file
    int serverSocket;
    struct sockaddr_in serverAddr;
    socklen_t addr_size;
    exponential_distribution<double> exp_red_wait = exponential_distribution<double>(0.1); // wait
    exponential_distribution<double> exp_blue_wait = exponential_distribution<double>(0.1); // wait
    exponential_distribution<double> exp_send = exponential_distribution<double>(0.1); // send
    vector<int> list, span_child; // list of neigbours and spanning tree children
    vector<bool> channel_colour;
    vector<pair<string, int>> queue; // for implementation of stack

  public:
    TS() {
      this->state = 0;
      this->sent = false;
      this->dt = false;
      this->t_term = 0;
      // initialize socket vars and assign appropriate values.
      // Create the socket.
      this->serverSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
      memset(&(this->serverAddr), 0, sizeof(this->serverAddr));
      // Address family = Internet
      this->serverAddr.sin_family = AF_INET;
      // Set port number, using htons function to use proper byte order
      this->serverAddr.sin_port = htons(7799);
    }

    void set_new_lambda(std::exponential_distribution<double> *exp_dis, double val) {
        typename exponential_distribution<double>::param_type new_lambda(val);
        exp_dis->param(new_lambda);
    }

    // set local vaiables
    void assign_attr(int total, double lam_red_wait, double lam_blue_wait, double lam_send,
      double p, double q, vector<int>& list, vector<int>& span_child, int id, bool root, int parent) {
      this->total = total;
      this->id = id;
      this->p = p;
      this->q = q;
      this->root = root;
      set_new_lambda(&(this->exp_red_wait), lam_red_wait);
      set_new_lambda(&(this->exp_blue_wait), lam_blue_wait);
      set_new_lambda(&(this->exp_send), lam_send);
      this->list = list;
      this->t_children = span_child.size();
      this->span_child = span_child;
      this->parent = parent;
      this->channel_colour.resize(total, false);

      //Set IP address to localhost
      char addr[50];
      sprintf(addr, "127.0.0.%d", id);
      this->serverAddr.sin_addr.s_addr = inet_addr(addr);
      //Bind the address struct to the socket
      bind(this->serverSocket, (struct sockaddr *) &(this->serverAddr), sizeof(this->serverAddr));
      return;
    }

    void set_state(int state) {
      this->state = state;
      local_clock_mut[this->id - 2].lock();
      send_terminate();
      local_clock_mut[this->id - 2].unlock();
      return;
    }

    int get_id() {
      return this->id;
    }

    // Every period of time, based on a servers state (red/blue)
    // infect/cure correspondingly a fixed percentage of its neighbours.
    // Root enters dt and start sending warning messages to its neighbours.
    void send_channel(int clientSocket, char message[], int msg_len) {
      double sndSleepTime = this->exp_send(generator);
      usleep(sndSleepTime * 1000000);
      if(send(clientSocket, message, msg_len, 0) < 0) {
        printf("Send failed\n");
      }
      return;
    }

    // Every period of time, based on a servers state (red/blue)
    // infect/cure correspondingly a fixed percentage of its neighbours.
    void spread_others() {
      while(listenDone < this->total); // keep waiting until all recv threads are ready
      // init
      string index, print_helper, state_str;
      char message[30];
      char buffer[1024]; // will store "sec;n_sec"
      struct sockaddr_in to_serverAddr;
      memset(&to_serverAddr, 0, sizeof(to_serverAddr));
      socklen_t to_addr_size;
      to_serverAddr.sin_family = AF_INET;
      to_serverAddr.sin_port = htons(7799);
      memset(to_serverAddr.sin_zero, '\0', sizeof to_serverAddr.sin_zero);
      // addr char[] to construct other server address
      char addr[50];

      if (this->root) {
        string print_helper =  "Cell " + to_string(this->id - 1)
         + " initiates Termination Process at " + currTime() + '\n';
        write_lock.lock();
        log_file<<print_helper;
        log_file.flush();
        write_lock.unlock();
        // send warning msgs
        sprintf(message, "%s;%d", "warning", this->id - 2);
        for(int i = 0; i < this->list.size(); i++) {
          // socket as client
          int clientSocket;
          clientSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
          if (clientSocket < 0) {
            perror("socket() failed");
            exit(-1);
          }
          sprintf(addr, "127.0.0.%d", this->list[i] + 1);
          to_serverAddr.sin_addr.s_addr = inet_addr(addr);

          int err = inet_pton(AF_INET, addr, &to_serverAddr.sin_addr.s_addr); // Convert IPv4 and IPv6 addresses from text to binary form
          if (err <= 0) {
            perror("inet_pton() failed");
            exit(-1);
          }
          if (connect(clientSocket, (struct sockaddr *) &to_serverAddr, sizeof(to_serverAddr)) < 0) {
            printf("we trying: %d to %s\n", id, addr);
            perror("connect() failed\n");
            exit(-1);
          }
          string print_helper =  "Cell " + to_string(this->id - 1) + " sends warning msg to "
            + to_string(this->list[i]) + " at " + currTime() + '\n';
          write_lock.lock();
          log_file<<print_helper;
          log_file.flush();
          write_lock.unlock();
          send_channel(clientSocket, message, strlen(message));
          close(clientSocket);
        }
      }

      // add inf loop if state = 0 sleep for a sec and continue;
      while(1) {
        int currState = this->state;
        if (currState == 0) {
          sleep(1);
          continue;
        }
        if (currState == 1) {
          state_str = "red";
        }
        else state_str = "blue";
        sprintf(message, "%s;%d", state_str.c_str(), this->id - 2);
        vector<int> sample;
        if (currState == 1) { // red. find which members to send
          int total_send = ceil(this->p * this->list.size());
          std::sample(this->list.begin(), this->list.end(),
                std::back_inserter(sample),
                total_send,
                std::mt19937{std::random_device{}()});
        } else { // blue. find which members to send
          int total_send = ceil(this->q * this->list.size());
          std::sample(this->list.begin(), this->list.end(),
                std::back_inserter(sample),
                total_send,
                std::mt19937{std::random_device{}()});
        }
        for(int i = 0; i < sample.size(); i++) {
          if (sample[i] + 1 == this->id) continue; // same server
          // check if channel is coloured
          local_clock_mut[this->id - 2].lock();
          if (currState == 1 && this->channel_colour[sample[i] - 1]) {
            string print_helper =  "Cell " + to_string(this->id - 1) +
            " stores TO(" + to_string(sample[i]) + ") entry into queue at " +  currTime() + '\n';
            write_lock.lock();
            log_file<<print_helper;
            log_file.flush();
            write_lock.unlock();
            pair <string, int> queue_entry("TO", sample[i] - 1);
            queue.push_back(queue_entry);
          }
          local_clock_mut[this->id - 2].unlock();
          // socket as client
          int clientSocket;
          clientSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
          if (clientSocket < 0) {
            perror("socket() failed");
            exit(-1);
          }
          sprintf(addr, "127.0.0.%d", sample[i] + 1);
          to_serverAddr.sin_addr.s_addr = inet_addr(addr);

          int err = inet_pton(AF_INET, addr, &to_serverAddr.sin_addr.s_addr); // Convert IPv4 and IPv6 addresses from text to binary form
          if (err <= 0) {
            perror("inet_pton() failed");
            exit(-1);
          }

          print_helper =  "Cell " + to_string(this->id - 1) + " sends " + state_str + " msg to Cell "
                            + to_string(sample[i]) + " at " + currTime() + '\n';
          write_lock.lock();
          log_file<<print_helper;
          log_file.flush();
          write_lock.unlock();

          // send message now
          if (connect(clientSocket, (struct sockaddr *) &to_serverAddr, sizeof(to_serverAddr)) < 0) {
            printf("we trying: %d to %s\n", id, addr);
            perror("connect() failed\n");
            exit(-1);
          }
          send_channel(clientSocket, message, strlen(message));
          close(clientSocket);
        }
        // based on red msg / blue msg
        double waitSleepTime;
        if (currState == 1)
          waitSleepTime = this->exp_red_wait(generator);
        else waitSleepTime = this->exp_blue_wait(generator);
        usleep(waitSleepTime * 1000000);
      }
    }

    parsedData parse_data(string str) {
      vector<string> result;
      stringstream s_stream(str); //create string stream from the string
      while(s_stream.good()) {
        string substr;
        getline(s_stream, substr, ';'); //get first string delimited by semi-colon
        result.push_back(substr);
      }
      struct parsedData data;
      data.msg = result[0];
      data.channel = stol(result[1], nullptr, 10);
      return data;
    }

    // Removes entries and sends remove_entry msgs from the stack until
    // the first entry of the form “TO”
    void stack_cleanup() {
      char buffer[1024]; // will store "sec;n_sec"
      struct sockaddr_in to_serverAddr;
      memset(&to_serverAddr, 0, sizeof(to_serverAddr));
      socklen_t to_addr_size;
      to_serverAddr.sin_family = AF_INET;
      to_serverAddr.sin_port = htons(7799);
      memset(to_serverAddr.sin_zero, '\0', sizeof to_serverAddr.sin_zero);
      char addr[50];
      char message[30];
      string print_helper =  "Cell " + to_string(this->id - 1) +
        " calls stack_cleanup at " +  currTime() + '\n';
      write_lock.lock();
      log_file<<print_helper;
      log_file.flush();
      write_lock.unlock();
      sprintf(message, "%s;%d", "remove", this->id - 2);
      int num_of_del = 0;
      for (auto i = queue.end() - 1; i != queue.begin() - 1; i--) {
        if ((*i).first != "TO") {
          string print_helper =  "Cell " + to_string(this->id - 1) +
            " removes and sends remove_entry msg to " + to_string((*i).second + 1) +  "at " +  currTime() + '\n';
          write_lock.lock();
          log_file<<print_helper;
          log_file.flush();
          write_lock.unlock();
          // send remove msg
          // socket as client
          int clientSocket;
          clientSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
          if (clientSocket < 0) {
            perror("socket() failed");
            exit(-1);
          }
          sprintf(addr, "127.0.0.%d", (*i).second + 2);
          to_serverAddr.sin_addr.s_addr = inet_addr(addr);

          int err = inet_pton(AF_INET, addr, &to_serverAddr.sin_addr.s_addr); // Convert IPv4 and IPv6 addresses from text to binary form
          if (err <= 0) {
            perror("inet_pton() failed");
            exit(-1);
          }
          if (connect(clientSocket, (struct sockaddr *) &to_serverAddr, sizeof(to_serverAddr)) < 0) {
            printf("we trying: %d to %s\n", id, addr);
            perror("connect() failed\n");
            exit(-1);
          }
          send_channel(clientSocket, message, strlen(message));
          close(clientSocket);
          num_of_del++;
        } else {
          break;
        }
      }
      if (num_of_del == 0)
        return;
      else {
        queue.erase(queue.begin() + queue.size() - num_of_del, queue.end());
      }
    }

    // Receives the incoming msg. Gets infected if it is a red msg or gets cured
    // if it is a blue msg. If it is a black or white token, correspondingly takes action.
    // encodes data to be sent and sends it via send_channel to simulate message via the channel.
    void setInfection(int clntSock, struct sockaddr_in clntAddr, socklen_t clntAddrLen) {
      string index, print_helper;
      char clntIpAddr[INET_ADDRSTRLEN];
      if (inet_ntop(AF_INET, &clntAddr.sin_addr.s_addr, clntIpAddr, sizeof(clntIpAddr)) != NULL) {
        // printf("----\nHandling client %s %d\n",
            // clntIpAddr, ntohs(clntAddr.sin_port));
        int x = 1; // dummy statement
      } else {
        cerr << "----\nUnable to get client IP Address" << endl;
      }

      // Receive data (get the state)
      char buffer[BUFSIZE], message[30];
      memset(buffer, 0, BUFSIZE);
      ssize_t recvLen = recv(clntSock, buffer, BUFSIZE - 1, 0);
      if (recvLen < 0) {
        perror("recv() failed");
        exit(-1);
      }
      buffer[recvLen] = '\0';
      close(clntSock);
      // received data successfully. log info (if this is not token info)
      // parse data
      string str(buffer);
      if (str.size() == 0) {
        // initialization issue
        return;
      }
      struct parsedData data;
      data = this->parse_data(str);

      // log info
      if (data.msg == "warning")
        print_helper =  "Cell " + to_string(this->id - 1) + " receives warning msg from "
        + to_string(data.channel + 1) + " at " + currTime() + '\n';
      else if (data.msg == "red" || data.msg == "blue") // blue or red
        print_helper =  "Cell " + to_string(this->id - 1) + " receives " + data.msg + " msg at "
        + currTime() + '\n';
      write_lock.lock();
      log_file<<print_helper;
      log_file.flush();
      write_lock.unlock();

      local_clock_mut[this->id - 2].lock();
      // these will be set irrespective of dt or ndt
      if (data.msg == "red") { // just set state
        this->state = 1;
      } else if (data.msg == "blue") { // just set state
        this->state = 2;
      }

      if (!this->dt) { // didnt send warning to others yet
        // check what msg is recved
        if (data.msg == "warning") {
          this->dt = true;
          this->channel_colour[data.channel] = true;
          // now send all its children warning msg
          sprintf(message, "%s;%d", "warning", this->id - 2);
          char addr[50];
          struct sockaddr_in to_serverAddr;
          memset(&to_serverAddr, 0, sizeof(to_serverAddr));
          socklen_t to_addr_size;
          to_serverAddr.sin_family = AF_INET;
          to_serverAddr.sin_port = htons(7799);
          memset(to_serverAddr.sin_zero, '\0', sizeof to_serverAddr.sin_zero);
          for(int i = 0; i < this->list.size(); i++) {
            // warning msg log.
            string print_helper =  "Cell " + to_string(this->id - 1) + " sends warning msg to "
            + to_string(this->list[i]) + " at " + currTime() + '\n';
            write_lock.lock();
            log_file<<print_helper;
            log_file.flush();
            write_lock.unlock();
            // socket as client
            int clientSocket;
            clientSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
            if (clientSocket < 0) {
              perror("socket() failed");
              exit(-1);
            }
            sprintf(addr, "127.0.0.%d", this->list[i] + 1);
            to_serverAddr.sin_addr.s_addr = inet_addr(addr);

            int err = inet_pton(AF_INET, addr, &to_serverAddr.sin_addr.s_addr); // Convert IPv4 and IPv6 addresses from text to binary form
            if (err <= 0) {
              perror("inet_pton() failed");
              exit(-1);
            }
            if (connect(clientSocket, (struct sockaddr *) &to_serverAddr, sizeof(to_serverAddr)) < 0) {
              printf("we trying: %d to %s\n", id, addr);
              perror("connect() failed\n");
              exit(-1);
            }
            send_channel(clientSocket, message, strlen(message));
            close(clientSocket);
          }
        }
        local_clock_mut[this->id - 2].unlock();
        return;
      } else { // dt state
        // check if it is a warning msg. if so colour and return
        if (data.msg == "warning") {
          this->channel_colour[data.channel] = true;
          local_clock_mut[this->id - 2].unlock();
          return;
        }
        // node is in dt state so continue with t.d. algo
        local_clock_mut[this->id - 2].unlock();
      }

      // check if node is in dt but channel is still not in dt. (to process red and blue)
      if (!this->channel_colour[data.channel]) {
        // not coloured so only change state
        // already state change done before so we just have to return
        return;
      }
      // at this point we know that this node has the particular incoming channels
      // and itself in dt and the msg is blue/red

      local_clock_mut[this->id - 2].lock();
      if (data.msg == "red") {
        // signifies basic msg
        print_helper =  "Cell " + to_string(this->id - 1) +
        " stores FROM(" + to_string(data.channel + 1) + ") entry into queue at " +  currTime() + '\n';
        write_lock.lock();
        log_file<<print_helper;
        log_file.flush();
        write_lock.unlock();
        pair <string, int> queue_entry("FROM", data.channel);
        queue.push_back(queue_entry);
      } else if (data.msg == "blue") {
        // signifies end of this proc execution
        stack_cleanup();
      } else if (data.msg == "remove") {
        // receive remove entry procedure
        print_helper =  "Cell " + to_string(this->id - 1) +
        " calls receive_remove_entry on " + to_string(data.channel + 1) + " at " +  currTime() + '\n';
        write_lock.lock();
        log_file<<print_helper;
        log_file.flush();
        write_lock.unlock();
        for (auto i = queue.end() - 1; i != queue.begin() - 1; i--) {
          if ((*i).second == data.channel && (*i).first == "TO") {
            queue.erase(i);
            break;
          }
        }
        if (this->state == 2)
          stack_cleanup();
      } else if (data.msg == "terminate") {
        print_helper =  "Cell " + to_string(this->id - 1) +
        " receives terminate msg from " + to_string(data.channel + 1) + " at " +  currTime() + '\n';
        write_lock.lock();
        log_file<<print_helper;
        log_file.flush();
        write_lock.unlock();
        this->t_term++;
      }
      local_clock_mut[this->id - 2].unlock();;

      if (this->state == 2) {// not active
        local_clock_mut[this->id - 2].lock();
        send_terminate(); // need to trigger for every token msg recved and when process itself becomes blue. reset is already handled above
        local_clock_mut[this->id - 2].unlock();
      }
      return;
    }

    // listens for requests and serves replies accordingly using setInfection.
    void handle_replies() {
      if(listen(this->serverSocket, this->total)==0) // Listen on the socket, with "total" max connection requests queued
        int x = 1; // dummy statement // cout << this->id << " Listening\n" << endl;
      else
        cerr << "Error\n" << endl;
      end_lock.lock();
      listenDone++;
      end_lock.unlock();
      // client details
      struct sockaddr_in clntAddr;
      socklen_t clntAddrLen = sizeof(clntAddr);
      while(1) {
        // Wait for a client to connect
        int clntSock = accept(this->serverSocket, (struct sockaddr *) &clntAddr, &clntAddrLen);
        if (clntSock < 0) {
          cerr << "accept() failed" << endl;
          exit(-1);
        }
        // setInfection(clntSock, clntAddr, clntAddrLen); // handles token recv and message recv
        thread th = thread(&TS::setInfection, this, clntSock, clntAddr, clntAddrLen);
        th.detach();
      }
      close(this->serverSocket);
    }

    // Checks appropriate conditions as described in A&M to determine
    // if it can send a terminated msg to its parent or end execution if root,
    void send_terminate() {
      char buffer[1024]; // will store "sec;n_sec"
      struct sockaddr_in to_serverAddr;
      memset(&to_serverAddr, 0, sizeof(to_serverAddr));
      socklen_t to_addr_size;
      to_serverAddr.sin_family = AF_INET;
      to_serverAddr.sin_port = htons(7799);
      memset(to_serverAddr.sin_zero, '\0', sizeof to_serverAddr.sin_zero);
      char addr[50];
      char message[30];
      // check if idle
      if (this->state == 2) {
        // now check if all incoming states are coloured
        for(int i = 0; i < this->list.size(); i++) {
          if (!this->channel_colour[this->list[i] - 1])
            return; // not coloured so return no need to send terminate
        }
        if (!queue.empty()) {
          write_lock.lock();
          cout<<"check: "<<this->id - 1<<" "<<queue.size()<<endl;
            for(int i = queue.size() - 1; i >= 0; i--)
              cout<<queue[i].first<<" "<<queue[i].second  + 1<<endl;
          write_lock.unlock();
          return;
        }
        // check if children have sent terminate
        if (t_term == t_children) {
          if (this->root) {
            // log ending
            string print_helper =  "Cell " + to_string(this->id - 1) +
            " (coordinator) ends the t.d. algo" + " at " + currTime() + '\n';
            write_lock.lock();
            log_file<<print_helper;
            log_file.flush();
            write_lock.unlock();
            exit(EXIT_SUCCESS); // everything is properly done.
          } else { // normal servers
            // send parent terminate
            if (this->sent == false) {
              sprintf(message, "%s;%d", "terminate", this->id - 2);
              int clientSocket;
              clientSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
              if (clientSocket < 0) {
                perror("socket() failed");
                exit(-1);
              }
              sprintf(addr, "127.0.0.%d", this->parent + 1);
              to_serverAddr.sin_addr.s_addr = inet_addr(addr);
              int err = inet_pton(AF_INET, addr, &to_serverAddr.sin_addr.s_addr); // Convert IPv4 and IPv6 addresses from text to binary form
              if (err <= 0) {
                perror("inet_pton() failed");
                exit(-1);
              }
              // send message now
              if (connect(clientSocket, (struct sockaddr *) &to_serverAddr, sizeof(to_serverAddr)) < 0) {
                printf("we trying: %d to %s\n", id, addr);
                perror("connect() failed\n");
                exit(-1);
              }
              send_channel(clientSocket, message, strlen(message));
              close(clientSocket);
            }
            // once sent, no need to send terminate again, later on
            this->sent = true;
          }
        } else return; // children still running
      }
    }
};

void getInput(int* ntime, int* red_intro, int* blue_intro, double *lam_red_intro,
  double *lam_blue_intro, vector<TS> &t_servers) {
  ifstream input;

  input.open("inp-params.txt");
  double lam_red_wait, lam_blue_wait, lam_send, p, q;
  input >> *ntime >> *lam_red_intro >> *red_intro >> *lam_blue_intro >> *blue_intro >> lam_red_wait
         >> lam_blue_wait >> lam_send >> p >> q;
  int n = *ntime;
  // process adjacency list
  vector<int> temp;
  vector<vector<int>> adj(n, temp);
  vector<vector<int>> span(n, temp);
  string str;
  while(n--) {
    getline(input, str, '\n');
    if (str.size() == 0) {
      n++;
      continue;
    }
    stringstream s(str);
    int node, node_main;
    s >> node_main;
    vector<int> list;
    while (s >> node)
      list.push_back(node);
    adj[node_main - 1] = list;
  }
  // here have to process the spanning tree. finc root. make parent for each node and children for each node
  int coord_node;
  int parent[*ntime];
  bool iter_start = true;
  while (!input.eof()) {
    getline(input, str);
    if (str.size() == 0) {
      continue;
    }
    stringstream s(str);
    int node, node_main;
    s >> node_main;
    if (iter_start) {
      iter_start = false;
      coord_node = node_main;
      parent[coord_node - 1] = coord_node; // we store index 1
    }
    vector<int> list;
    while (s >> node) {
      list.push_back(node);
      parent[node - 1] = node_main;
    }
    span[node_main - 1] = list;
  }
  // //check inp
  // for(int i = 0; i < adj.size(); i++) {
  //   for (int j = 0; j < adj[i].size(); j++)
  //     cout << adj[i][j] << " ";
  //   cout<<endl;
  // }
  // cout<<endl;
  // for(int i = 0; i < span.size(); i++) {
  //   cout<<"iter: "<<i + 1<<endl;
  //   for (int j = 0; j < span[i].size(); j++)
  //     cout << span[i][j] << " ";
  //   cout<<endl;
  // }
  // cout<<"co: "<<coord_node;
  // exit(0);
  n = *ntime;
  bool isRoot;
  while(n--) {
    TS new_server;
    isRoot = (*ntime) - n == coord_node ? true : false;
    int id = (*ntime) - n - 1;
    // cout<<isRoot<<" before insert: "<<id + 1 << " "<<adj[id].size()<<" "<<span[id].size()<<endl;
    new_server.assign_attr(*ntime, lam_red_wait, lam_blue_wait, lam_send,
      p, q, adj[id], span[id], id + 2, isRoot, parent[id]); // n starts with index 2
    t_servers.push_back(new_server);
  }
  input.close();

  return;
}

void server_simulate(TS* t_servers) {
  // spawn two threads
  // send - inf loop for red/blue
  thread th_send(&TS::spread_others, t_servers);
  // recv - inf loop for red/blue
  thread th_recv(&TS::handle_replies, t_servers);
  th_send.join();
  th_recv.join();
  return;
}

int main() {
  int ntime, red_intro, blue_intro; // number of time_servers and number of blue/red introduced
  double lam_red_intro, lam_blue_intro;
  vector<TS> t_servers;
  getInput(&ntime, &red_intro, &blue_intro, &lam_red_intro, &lam_blue_intro, t_servers);
  if(ntime == 1) {
    // no synch needed
    exit(EXIT_SUCCESS);
  }
  // create ntime threads for time servers and respective locks
  thread *th_ts = new thread[ntime];
  local_clock_mut = new mutex[t_servers.size()];

  // open log file
  log_file.open("out-log.txt");

  // get start timestamp
  if(clock_gettime(CLOCK_REALTIME, &start_time) == -1 ) {
    cerr << "clock_gettime failed" << endl;
    exit( EXIT_FAILURE );
  }

  for(int i = 0; i < ntime; i++) {
    th_ts[i] = thread(server_simulate, &t_servers[i]);
  }
  // thread th_red = thread(red_spawn, ntime, red_intro, lam_red_intro, t_servers);
  // thread th_blue = thread(blue_spawn, ntime, blue_intro, lam_blue_intro, t_servers);
  // th_red.join();
  // th_blue.join();

  string print_helper;
  // red spawn
  double waitSleepTime_red, waitSleepTime_blue;
  exponential_distribution<double> exp_wait_red = exponential_distribution<double>(lam_red_intro);
  waitSleepTime_red = exp_wait_red(generator);
  usleep(waitSleepTime_red * 1000000);

  // select which nodes to turn red
  vector<int> nodes(ntime);
  std::iota (std::begin(nodes), std::end(nodes), 0);

  vector<int> sample_red;
  std::sample(nodes.begin(), nodes.end(),
              std::back_inserter(sample_red),
              red_intro,
              std::mt19937{std::random_device{}()});

  for(int i = 0; i < sample_red.size(); i++) {
    print_helper =  "Cell " + to_string(sample_red[i] + 1) + " turns red at " + currTime() + '\n';
    write_lock.lock();
    log_file<<print_helper;
    log_file.flush();
    write_lock.unlock();
    t_servers[sample_red[i]].set_state(1);
  }

  // blue spawn
  exponential_distribution<double> exp_wait_blue = exponential_distribution<double>(lam_blue_intro);
  waitSleepTime_blue = exp_wait_blue(generator);
  waitSleepTime_blue -= waitSleepTime_red;
  if (waitSleepTime_blue > 0)
    usleep(waitSleepTime_blue * 1000000);

  vector<int> sample_blue;
  std::sample(nodes.begin(), nodes.end(),
              std::back_inserter(sample_blue),
              blue_intro,
              std::mt19937{std::random_device{}()});

  for(int i = 0; i < sample_blue.size(); i++) {
    print_helper =  "Cell " + to_string(sample_blue[i] + 1) + " turns blue at " + currTime() + '\n';
    write_lock.lock();
    log_file<<print_helper;
    log_file.flush();
    write_lock.unlock();
    t_servers[sample_blue[i]].set_state(2);
  }

  // join the time server threads
  for (int i = 0; i < ntime; i++) {
    th_ts[i].join();
  }
  delete [] th_ts;
  log_file.close();
  return 0;
}
