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

atomic<int> FullQueueCount;
mutex m;

class Queue {
public:
  int head;
  int tail;
  int* q;
  int size;

  // Queue initialization
  Queue(int k) {
    q = new int[k];
    size = k;
    // init k nodes
    for(int i = 0; i < k; i++) {
      q[i] = 0;
    }
    head = -1;
    tail = -1;
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
    m.lock();
    if((head == 0 && tail == size - 1) || (tail == (head - 1)%(size - 1))) {
      // DEBUG
      #ifndef DEBUG_MODE
        string helper;
        time_t enterTime = time(NULL);
        helper = to_string(th_id + 1) + " thread is doing enqueue but queue is full at " +
                        currTime(enterTime);
        fprintf(out_file, "%s\n", helper.c_str());
        fflush(NULL);
      #endif
      m.unlock();
      FullQueueCount++;
      return false;
    } else if (head == -1) {
      head = tail = 0;
      q[tail] = data;
    } else if (tail == size-1 && head != 0) {
      tail = 0;
      q[tail] = data;
    } else {
      tail++;
      q[tail] = data;
    }

    // DEBUG
    #ifndef DEBUG_MODE
      auto enterTime = time(NULL);
      string helper = to_string(th_id + 1) + " thread is doing enqueue " + to_string(data) + " at " +
                      currTime(enterTime);
      fprintf(out_file, "%s\n", helper.c_str());
      fflush(NULL);
    #endif
    m.unlock();
    return true;
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
    m.lock();
    if (head == -1) {
      // DEBUG
      #ifndef DEBUG_MODE
        string helper;
        time_t enterTime = time(NULL);
        helper = to_string(th_id + 1) + " thread is doing dequeue but queue is empty at " +
                        currTime(enterTime);
        fprintf(out_file, "%s\n", helper.c_str());
        fflush(NULL);
      #endif
      m.unlock();
      return INT_MIN;
    }

    int data = q[head];
    if (head == tail) {
      head = tail = -1;
    } else if (head == size-1) head = 0;
    else head++;

    // DEBUG
    #ifndef DEBUG_MODE
      auto enterTime = time(NULL);
      string helper = to_string(th_id + 1) + " thread is doing dequeue " + to_string(data) + " at " +
                      currTime(enterTime);
      fprintf(out_file, "%s\n", helper.c_str());
      fflush(NULL);
    #endif

    m.unlock();
    return data;
  }

  ~Queue() {
    delete[] q;
  }
};


void simulator(int th_id, int max_ops, Queue &q) {
  int id = th_id;
  // start of thread
  clock_t start, end;
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
