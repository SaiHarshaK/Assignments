/*
author: Sai Harsha Kottapalli
About: assignment for Parallel and Concurrent Program. Check ReadMe for instructions.
 */
#include <atomic>
#include <chrono>
#include <vector>
#include <iostream>
#include <cstdlib> // EXIT_FAILURE
#include <ctime>
#include <climits>
#include <fstream>
#include <random>
#include <string>
#include <thread>
#include <unistd.h>
#include <mutex>

using namespace std;

// #define DEBUG_MODE 1

// output files
FILE *out_file;
// storing times
vector<vector<double>> entry_log;

// helper function to obtain time in HH:MM:SS syntax from the obtained time parameter.
string currTime(time_t time_in) {
  struct tm* clock_time;
  char time[9];
  clock_time = localtime(&time_in);
  sprintf(time, "%.2d:%.2d:%.2d", clock_time->tm_hour, clock_time->tm_min, clock_time->tm_sec);
  return (string)time;
}

// QNode
class Node {
public:
  atomic<bool> empty; // Flag
  int data;
};

atomic<int> FullQueueCount;

class Queue {
public:
  atomic<int> head;
  atomic<int> tail;
  Node* q;
  int size;

  // Queue initialization
  Queue(int k) {
    q = new Node[k];
    size = k;
    // init k nodes
    for(int i = 0; i < k; i++) {
      q[i].data = 0;
      q[i].empty = true;
    }
    head = 0;
    tail = 0;
    FullQueueCount = 0;
  }

  bool enqueue(int data, int th_id) {
    {
    #ifndef DEBUG_MODE
      auto enterTime = time(NULL);
      string helper = to_string(th_id + 1) + " thread is going to do enqueue " + to_string(data) + " at " +
                      currTime(enterTime);
      fprintf(out_file, "%s\n", helper.c_str());
      fflush(NULL);
    #endif
    }
    int localTail = tail; //localTail is local
    while(true) {
      // Try any dummy node
      bool VTRUE = true;
      if(q[localTail].empty.compare_exchange_strong(VTRUE, false)) {
        // if tail points to empty dummy node
        q[localTail].data = data;
        while(tail != localTail) // if previous enqueue is still ongoing, wait for it to finish
          ;
        tail = (localTail + 1) % size;

        // DEBUG
        #ifndef DEBUG_MODE
          string helper;
          time_t enterTime = time(NULL);
          helper = to_string(th_id + 1) + " thread is doing enqueue " + to_string(data) + " at " +
                          currTime(enterTime);
          fprintf(out_file, "%s\n", helper.c_str());
          fflush(NULL);
        #endif

        return true; // as enqueue has ended successfully
      } else { // a concurrent enqueue has successfully enqueued, so this has to try the next dummy node
        localTail = (localTail + 1) % size;
        if(localTail == head) {
          FullQueueCount++;
          // DEBUG
          #ifndef DEBUG_MODE
            string helper;
            time_t enterTime = time(NULL);
            helper = to_string(th_id + 1) + " thread is doing enqueue but queue is full at " +
                            currTime(enterTime);
            fprintf(out_file, "%s\n", helper.c_str());
            fflush(NULL);
          #endif
          return false; // queue is full
        }
      }
    }
    // the below line is not reachable
    return false;
  }

  int dequeue(int th_id) {
    {
    #ifndef DEBUG_MODE
      auto enterTime = time(NULL);
      string helper = to_string(th_id + 1) + " thread is going to do dequeue at " +
                      currTime(enterTime);
      fprintf(out_file, "%s\n", helper.c_str());
      fflush(NULL);
    #endif
    }
    int localHead = head;
    while(true) {
      // Now if localHead points to non Emptynode
      bool VFALSE = false;
      if(q[localHead].empty.compare_exchange_strong(VFALSE, true)) {
        int data = q[localHead].data;
        while(localHead != head)
          ; // wait
        head = (localHead + 1) % size;

        // DEBUG
        #ifndef DEBUG_MODE
          string helper;
          time_t enterTime = time(NULL);
          helper = to_string(th_id + 1) + " thread is doing dequeue " + to_string(data) + " at " +
                          currTime(enterTime);
          fprintf(out_file, "%s\n", helper.c_str());
          fflush(NULL);
        #endif

        return data;
      } else {
        //If CAS fails because of a concurrent successful dequeue,try the next node
        localHead = (localHead + 1) % size;
        if(localHead = (tail + 1) % size) {
          // DEBUG
          #ifndef DEBUG_MODE
            string helper;
            time_t enterTime = time(NULL);
            helper = to_string(th_id + 1) + " thread is doing dequeue but queue is empty at " +
                            currTime(enterTime);
            fprintf(out_file, "%s\n", helper.c_str());
            fflush(NULL);
          #endif
          return INT_MIN; // queue is empty
        }
      }
    }
    // the below line is not reachable
    return INT_MIN;
  }

  ~Queue() {
    delete[] q;
  }
};


void simulator(int th_id, int max_ops, Queue &q) {
  int id = th_id;
  // start of thread
  // access CS k times
  for(int i = 0; i < max_ops; i++) {
    int val = rand() % (int)100;
    auto start = chrono::high_resolution_clock::now();
    if(rand() % 2) { // runs with 1/2 probability
      q.enqueue(val, th_id);
    } else {
      int val = q.dequeue(th_id);
    }
    auto stop = chrono::high_resolution_clock::now();
    auto timer = (chrono::duration_cast<chrono::microseconds>(stop - start));
    double total_time = timer.count() / 1e6;
    // sleep(1);
    entry_log[th_id].push_back(total_time);
  }
}

void getInput(int* n, int* max_ops) {
  ifstream input;

  input.open("inp-params.txt");
  if(!input.is_open()) {
    cerr<<"Error opening input file"<<'\n';
    exit ( EXIT_FAILURE );
  }
  input >> *n >> *max_ops;
  input.close();

  return;
}

int main() {
  int n, max_ops; // number of threads
  getInput(&n, &max_ops);

  entry_log = vector<vector<double>> (n);

  // n threads
  thread *th = new thread[n];
  // Declare a queue object which is accessed from all the threads
  Queue q(30);

  // open output file
  out_file = fopen("Fill_in_queue.txt", "w");

  // clock_t start, end;
  // start = clock();
  auto start = chrono::high_resolution_clock::now();
  // create n threads
  for(int i = 0; i < n; i++) {
    th[i] = thread(simulator, i, max_ops, ref(q));
  }
  // join the threads
  for (int i = 0; i < n; i++) {
    th[i].join();
  }

  // end = clock();
  auto stop = chrono::high_resolution_clock::now();
  // double total_time = double(end - start) / double(CLOCKS_PER_SEC);
  auto timer = (chrono::duration_cast<chrono::microseconds>(stop - start));
  double total_time = timer.count() / 1e6;

  fclose(out_file);
  delete [] th;

  double sum_time = 0;
  for(int i = 0; i < n; i++) {
    for(int j = 0; j < entry_log[i].size(); j++) {
      sum_time += entry_log[i][j];
    }
  }

  cout<<"Average time taken for thread to complete enq/deq: " << sum_time / n << '\n';
  return 0;
}
