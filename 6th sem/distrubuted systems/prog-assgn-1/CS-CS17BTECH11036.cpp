/*
author: Sai Harsha Kottapalli
About: assignment for Distributed computing. Check ReadMe for instructions.
 */
#include <iostream>
#include <cstdio>
#include <fstream>
#include <sstream>
#include <vector>
#include <ctime>
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
int roundDone = 0, listenDone = 0;
mutex* local_clock_mut;
default_random_engine generator(chrono::high_resolution_clock::to_time_t(chrono::high_resolution_clock::now())); // seed it
vector<vector<timespec>> data;
timespec start_time;

// helper function to obtain time in HH:MM:SS syntax from the obtained time parameter.
string currTime(time_t time_in) {
  struct tm* clock_time;
  char time[9];
  clock_time = localtime(&time_in);
  sprintf(time, "%.2d:%.2d:%.2d", clock_time->tm_hour, clock_time->tm_min, clock_time->tm_sec);
  return (string)time;
}

void generate_table(int k, int total) {
  write_lock.lock();
  log_file << "\n\n\n\t\t\t";
  log_file << fixed;
  log_file << setprecision(3);
  for(int i = 1; i <= k; i++) {
    log_file << "Round" << i << "\t\t\t\t\t\t\t";
  }
  log_file << endl;
  for(int i = 1; i <= total; i++) {
    log_file << "P" << i;
    log_file << "\t\t";
    for(int j = 0; j < k; j++) {
      double x = data[i - 1][j].tv_sec - start_time.tv_sec;
      x += data[i - 1][j].tv_nsec / 10e9 - start_time.tv_nsec / 10e9;
      log_file << x << "\t\t\t\t\t\t";
    }
    log_file << endl;
  }
  // print mean and variance
  log_file << "Mean\t";
  vector<double> variance;
  for(int i = 1; i <= k; i++) {
    double sum = 0;
    for(int j = 0; j < total; j++) {
      sum += data[j][i - 1].tv_sec - start_time.tv_sec;
      sum += data[j][i - 1].tv_nsec / 10e9 - start_time.tv_nsec / 10e9;
    }
    double mean = sum / (double)total;
    double sqDiff = 0, temp;
    for (int j = 0; j < total; j++) {
      temp = data[j][i - 1].tv_sec - start_time.tv_sec;
      temp += data[j][i - 1].tv_nsec / 10e9 - start_time.tv_nsec / 10e9;
      sqDiff += (temp - mean) * (temp - mean);
    }
    variance.push_back(sqDiff / total);
    log_file << mean << "\t\t";
  }
  log_file << endl;
  log_file << "Var\t";
  for(int i = 1; i <= k; i++) {
    log_file << variance[i - 1] << "\t\t";
  }
  log_file.close();
  write_lock.unlock();
}

class TS {
  private:
    int total, k, id, runs; // id -> thread identifier, total -> total servers, k -> number of rounds of sunchronization, runs -> number of messages sent
    double lam_p, lam_q, lam_send, lam_drift;
    int serverSocket;
    struct sockaddr_in serverAddr;
    socklen_t addr_size;
    exponential_distribution<double> exp_req = exponential_distribution<double>(0.1); // request - p
    exponential_distribution<double> exp_rep = exponential_distribution<double>(0.1); // reply - q
    exponential_distribution<double> exp_send = exponential_distribution<double>(0.1);
    exponential_distribution<double> exp_drift = exponential_distribution<double>(0.1);
    exponential_distribution<double> exp_drift_sleep = exponential_distribution<double>(0.1);
    double driftFactor, errorfactor;
    vector<timespec> synch_time;

  public:
    TS() {
      this->errorfactor = -1 + static_cast <float> (rand()) /( static_cast <float> (RAND_MAX/(2))); // rand in [-1,1]
      this->driftFactor = 0;
      this->runs = 0;
      // initialize socket vars and assign appropriate values.
      // Create the socket.
      this->serverSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
      memset(&(this->serverAddr), 0, sizeof(this->serverAddr));
      // Address family = Internet
      this->serverAddr.sin_family = AF_INET;
      // Set port number, using htons function to use proper byte order
      this->serverAddr.sin_port = htons(7799);
    }

    int get_k() {
      return this->k;
    }

    void set_new_lambda(std::exponential_distribution<double> *exp_dis, double val) {
        typename exponential_distribution<double>::param_type new_lambda(val);
        exp_dis->param(new_lambda);
    }

    void assign_attr(int k, int total, double lam_p, double lam_q, double lam_send, double lam_drift, int id, double dft_sleep) {
      this->k = k;
      this->total = total;
      this->id = id;
      set_new_lambda(&(this->exp_req), lam_p);
      set_new_lambda(&(this->exp_rep), lam_q);
      set_new_lambda(&(this->exp_send), lam_send);
      set_new_lambda(&(this->exp_drift), lam_drift);
      set_new_lambda(&(this->exp_drift_sleep), dft_sleep);

      //Set IP address to localhost
      char addr[50];
      sprintf(addr, "127.0.0.%d", id);
      this->serverAddr.sin_addr.s_addr = inet_addr(addr);
      //Bind the address struct to the socket
      bind(this->serverSocket, (struct sockaddr *) &(this->serverAddr), sizeof(this->serverAddr));
      return;
    }

    /* Invoked by processes ( and their threads ) to read the current time */
    timespec read() {
      struct timespec start;
      // time_t tv_sec  whole seconds (valid values are >= 0). time_t is simply a long int.
      // long tv_nsec  nanoseconds (valid values are [0, 999999999])
      if(clock_gettime(CLOCK_REALTIME, &start) == -1 ) {
        cerr << "clock_gettime failed" << endl;
        exit( EXIT_FAILURE );
      }
      local_clock_mut[this->id - 2].lock();
      start.tv_sec += this->errorfactor + this->driftFactor;
      local_clock_mut[this->id - 2].unlock();
      return (start);
    }

    // Used by processes to correct their clock
    void update(int optimal_delta) {
      local_clock_mut[this->id - 2].lock();
      this->errorfactor += optimal_delta;
      local_clock_mut[this->id - 2].unlock();
    }

    // Runs in a separate thread
    void IncrementDriftFactor() {
      int limit = (this->total - 1) * this->k;
      while (this->runs < limit) {
        /* clock_drift is exponentially distributed wrt λdrift and can be positive as well as negative */
        double clock_drift = this->exp_drift(generator);
        local_clock_mut[this->id - 2].lock();
        this->driftFactor = this->driftFactor + clock_drift;
        local_clock_mut[this->id - 2].unlock();
        double dftSleepTime = this->exp_drift_sleep(generator);
        usleep(dftSleepTime * 1000000);
      }
    }

    timespec timespec_t2_from_string(char buff[]) {
      string str(buff);
      vector<string> result;
      stringstream s_stream(str); //create string stream from the string
      while(s_stream.good()) {
        string substr;
        getline(s_stream, substr, ';'); //get first string delimited by semi-colon
        result.push_back(substr);
      }
      struct timespec new_time;
      new_time.tv_sec = stol(result[0], nullptr, 10);
      new_time.tv_nsec = stol(result[1], nullptr, 10);
      return new_time;
    }

    timespec timespec_t3_from_string(char buff[]) {
      string str(buff);
      vector<string> result;
      stringstream s_stream(str); //create string stream from the string
      while(s_stream.good()) {
        string substr;
        getline(s_stream, substr, ';'); //get first string delimited by semi-colon
        result.push_back(substr);
      }
      struct timespec new_time;
      new_time.tv_sec = stol(result[2], nullptr, 10);
      new_time.tv_nsec = stol(result[3], nullptr, 10);
      return new_time;
    }

    void send_channel(int clientSocket, char message[], int msg_len) {
      double sndSleepTime = this->exp_send(generator);
      usleep(sndSleepTime * 1000000);
      if(send(clientSocket, message, msg_len, 0) < 0) {
        printf("Send failed\n");
      }
      return;
    }

    void synchronize_requests() {
      while(listenDone < this->total); // keep waiting until all recv threads are ready
      // init
      time_t timestamp;
      string index, print_helper;
      char message[20];
      char buffer[1024]; // will store "sec;n_sec"
      struct sockaddr_in to_serverAddr;
      memset(&to_serverAddr, 0, sizeof(to_serverAddr));
      socklen_t to_addr_size;
      to_serverAddr.sin_family = AF_INET;
      to_serverAddr.sin_port = htons(7799);
      memset(to_serverAddr.sin_zero, '\0', sizeof to_serverAddr.sin_zero);
      // addr char[] to construct other server address
      char addr[50];
      for(int round = 1; round <= this->k; round++) {
        sprintf(message, "%d;%d", this->id, round);
        for(int i = 0; i < this->total; i++) {
          if (i + 2 == this->id) continue; // same server
          // socket as client
          int clientSocket;
          clientSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
          if (clientSocket < 0) {
            perror("socket() failed");
            exit(-1);
          }
          sprintf(addr, "127.0.0.%d", i+2);
          to_serverAddr.sin_addr.s_addr = inet_addr(addr);

          int err = inet_pton(AF_INET, addr, &to_serverAddr.sin_addr.s_addr); // Convert IPv4 and IPv6 addresses from text to binary form
          if (err <= 0) {
            perror("inet_pton() failed");
            exit(-1);
          }

          struct timespec t1 = this->read();
          // format: Server1 requests 1st clock synchronization to Server 2 at 10:00
          timestamp = time(NULL);
          // index helper
          if(round == 1) index = "st";
          else if(round == 2) index = "nd";
          else if(round == 3) index = "rd";
          else index = "th";
          print_helper =  "Server" + to_string(this->id - 1) + " requests " + to_string(round) + index + " clock synchronization to Server "
                            + to_string(i + 1) + " at " + currTime(timestamp) + '\n';
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
          //Read the message from the server into the buffer. T2,T3 times
          if(recv(clientSocket, buffer, 1024, 0) < 0) {
             cerr << "Receive failed\n" << endl;
          }
          // received reply, so log info
          timestamp = time(NULL);
          print_helper =  "Server" + to_string(this->id - 1) + " receives " + to_string(round) + index + " clock synchronization response from Server "
                            + to_string(i + 1) + " at " + currTime(timestamp) + '\n';
          write_lock.lock();
          log_file<<print_helper;
          log_file.flush();
          write_lock.unlock();

          struct timespec t2 = this->timespec_t2_from_string(buffer);
          struct timespec t3 = this->timespec_t3_from_string(buffer);

          struct timespec t4 = this->read();
          // compute delta
          // Computing 1st delta between server1 and server2: ...
          timestamp = time(NULL);
          print_helper =  "Computing " + to_string(round) + index + " delta between server" + to_string(this->id - 1) + " and server" + to_string(i + 1) + ": ..." + '\n';
          write_lock.lock();
          log_file<<print_helper;
          log_file.flush();
          write_lock.unlock();
          double x = t2.tv_sec + t3.tv_sec - t4.tv_sec - t1.tv_sec;
          x += (t2.tv_nsec)/10e9 + (t3.tv_nsec)/10e9 - (t4.tv_nsec)/10e9 - (t1.tv_nsec)/10e9;
          x /= 2;
          double y = (t4.tv_sec - t1.tv_sec) - (t3.tv_sec - t2.tv_sec);
          y += (t4.tv_sec - t1.tv_sec)/10e9 - (t3.tv_sec - t2.tv_sec)/10e9;
          y /= 2;
          // choose optimal delta in between [x - y/2, x + y/2]
          double optimal_delta =
              (x - y) + static_cast <float> (rand()) /( static_cast <float> (RAND_MAX/(2 * y))); // rand in [-1,1]
          this->update(optimal_delta);
          /* Sleep with exponential average of λsnd.
            Sleep is for simulation of work done by sender process.
          */
          close(clientSocket);
          double reqSleepTime = this->exp_req(generator);
          usleep(reqSleepTime * 1000000);
        }
        // 1 round pf synchronization done
        struct timespec new_t = this->read();
        synch_time.push_back(new_t);
        end_lock.lock();
        roundDone++;
        end_lock.unlock();
        while(roundDone % this->total != 0) ;
        if (round == this->k) { // last round
        // before pushing
        // write_lock.lock();
        // log_file<<"imp check starts: " << this->id -2 <<endl;
        // for(int z = 0; z < synch_time.size(); z++) {
        //   log_file <<  synch_time[z].tv_sec << " " << synch_time[z].tv_nsec <<endl;
        // }
        // log_file<<"imp check ends: " <<endl;
        // write_lock.unlock();
          data[this->id - 2] = synch_time;
        }
      }
      // generate_table(this->k, this->total);
    }

    void synchronize_reply(int clntSock, struct sockaddr_in clntAddr, socklen_t clntAddrLen) {
      string index, print_helper;
      char clntIpAddr[INET_ADDRSTRLEN];
      if (inet_ntop(AF_INET, &clntAddr.sin_addr.s_addr, clntIpAddr, sizeof(clntIpAddr)) != NULL) {
        // printf("----\nHandling client %s %d\n",
            // clntIpAddr, ntohs(clntAddr.sin_port));
        int x = 1; // dummy statement
      } else {
        cerr << "----\nUnable to get client IP Address" << endl;
      }

      // Receive data (the dummy message to signal, client wasnts to get time)
      char buffer[BUFSIZE];
      memset(buffer, 0, BUFSIZE);
      ssize_t recvLen = recv(clntSock, buffer, BUFSIZE - 1, 0);
      if (recvLen < 0) {
        perror("recv() failed");
        exit(-1);
      }
      buffer[recvLen] = '\n';
      // received data successfully. log info now
      // parse data
      string str(buffer);
      vector<string> result;
      stringstream s_stream(str); //create string stream from the string
      while(s_stream.good()) {
        string substr;
        getline(s_stream, substr, ';'); //get first string delimited by semi-colon
        result.push_back(substr);
      }
      int recv_from = stol(result[0], nullptr, 10) - 1, k = stol(result[1], nullptr, 10);
      // format: Server1 requests 1st clock synchronization to Server 2 at 10:00
      time_t timestamp = time(NULL);
      // index helper
      if(k == 1) index = "st";
      else if(k == 2) index = "nd";
      else if(k == 3) index = "rd";
      else index = "th";
      print_helper =  "Server" + to_string(this->id - 1) + " receives " + to_string(k) + index + " clock synchronization request from Server "
                        + to_string(recv_from) + " at " + currTime(timestamp) + '\n';
      write_lock.lock();
      log_file<<print_helper;
      log_file.flush();
      write_lock.unlock();

      // send time back now
      struct timespec t2 = this->read();
      double repSleepTime = this->exp_rep(generator) ;
      usleep(repSleepTime * 1000000);
      struct timespec t3 = this->read();

      // construct a string with struct
      string data = to_string(t2.tv_sec);
      data += ";";
      data += to_string(t2.tv_nsec);
      data += ";";
      data += to_string(t3.tv_sec);
      data += ";";
      data += to_string(t3.tv_nsec);
      data += ";";
      strcpy(buffer, data.c_str());

      // reply to be sent
      timestamp = time(NULL);
      print_helper =  "Server" + to_string(this->id - 1) + " replies " + to_string(k) + index + " clock synchronization response to Server "
                        + to_string(recv_from) + " at " + currTime(timestamp) + '\n';
      write_lock.lock();
      log_file<<print_helper;
      log_file.flush();
      write_lock.unlock();
      send_channel(clntSock, buffer, data.size());
      return;
    }

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
      int i = 0, limit = (this->total - 1) * this->k;
      while(this->runs < limit) {
        // Wait for a client to connect
        int clntSock = accept(this->serverSocket, (struct sockaddr *) &clntAddr, &clntAddrLen);
        if (clntSock < 0) {
          cerr << "accept() failed" << endl;
          exit(-1);
        }
        synchronize_reply(clntSock, clntAddr, clntAddrLen);
        this->runs++;
      }
      close(this->serverSocket);
    }
};

void getInput(int* ntime, vector<TS> &t_servers) {
  ifstream input;

  input.open("inp-params.txt");
  int k;
  double lam_p, lam_q, lam_send, lam_drift, dft_sleep;
  input >> *ntime >> k >> lam_p >> lam_q >> lam_send >> lam_drift >> dft_sleep;
  int n = *ntime;
  while(n--) {
    TS new_server;
    new_server.assign_attr(k, *ntime, lam_p, lam_q, lam_send, lam_drift, (*ntime) - n + 1, dft_sleep); // n starts with index 2
    t_servers.push_back(new_server);
  }
  input.close();

  return;
}

void server_simulate(TS t_servers) {
  // spawn three threads
  thread th_send(&TS::synchronize_requests, &t_servers);
  // recv - inf loop
  thread th_recv(&TS::handle_replies, &t_servers);
  // IncrementDriftFactor - inf loop
  thread th_drift(&TS::IncrementDriftFactor, &t_servers);
  th_send.join();
  th_recv.join();
  th_drift.join();
  return;
}

int main() {
  int ntime; // number of time_servers
  vector<TS> t_servers;
  getInput(&ntime, t_servers);
  if(ntime == 1) {
    // no synch needed
    exit(EXIT_SUCCESS);
  }
  // create ntime threads for time servers and respective locks
  thread *th_ts = new thread[ntime];
  local_clock_mut = new mutex[t_servers.size()];

  // open log file
  log_file.open("out-log.txt");

  // initialize the data for table
  for(int i = 0; i < ntime; i++) {
    timespec t;
    vector<timespec> t_dummy;
    t_dummy.push_back(t);
    data.push_back(t_dummy);
  }

  // get start timestamp so that we can use it to generate table
  if(clock_gettime(CLOCK_REALTIME, &start_time) == -1 ) {
    cerr << "clock_gettime failed" << endl;
    exit( EXIT_FAILURE );
  }

  for(int i = 0; i < ntime; i++) {
    th_ts[i] = thread(server_simulate, t_servers[i]);
  }
  // join the time server threads
  for (int i = 0; i < ntime; i++) {
    th_ts[i].join();
  }
  generate_table(t_servers[0].get_k(), ntime);
  delete [] th_ts;
  log_file.close();
  return 0;
}
