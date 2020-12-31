/*
author: Sai Harsha Kottapalli
About: assignment for Parallel and Concurrent Program. Check ReadMe for instructions.
 */
#include <atomic>
#include <iostream>
#include <cstdlib> // EXIT_FAILURE
#include <ctime>
#include <fstream>
#include <random>
#include <string>
#include <thread>
#include <unistd.h>

using namespace std;

// output files
ofstream out_file;
// storing times
vector<vector<double>> entry_log, exit_log;

// helper function to obtain time in HH:MM:SS syntax from the obtained time parameter.
string currTime(time_t time_in) {
  struct tm* clock_time;
  char time[9];
  clock_time = localtime(&time_in);
  sprintf(time, "%.2d:%.2d:%.2d", clock_time->tm_hour, clock_time->tm_min, clock_time->tm_sec);
  return (string)time;
}

// QNode
class QNode {
public:
  bool locked = false;
  QNode* next = NULL;
};

static thread_local QNode* myNode = new QNode();

// MCS Lock implementation
class MCS {
private:
  atomic<QNode*> tail;
public:
  MCS() {
    tail = NULL;
  }

  void lock() {
    QNode* pred = tail.exchange(myNode);
    if(pred != NULL) {
      myNode->locked = true;
      pred->next = myNode;
      // wait until predecessor gives up the lock
      while(myNode->locked) {}; // busy wait
    }
  }

  void unlock() {
    if(myNode->next == NULL) {
      if(tail.compare_exchange_strong(myNode, NULL))
        return;
      // wait until successor fills in the next field
      while(myNode->next == NULL) {};
    }
    myNode->next->locked = false;
    myNode->next = NULL;
  }

  ~MCS() {
    delete tail;
  }
};

void testCS(int th_id, int k,
  exponential_distribution<double> &d_t1,
  exponential_distribution<double> &d_t2,
  default_random_engine &gen,
  MCS &Test) {
  int id = th_id;
  string index;
  // start of thread
  clock_t start, end;
  // access CS k times
  for(int i = 0; i < k; i++) {
    // index helper
    if(i == 0) index = "st";
    else if(i == 1) index = "nd";
    else if(i == 2) index = "rd";
    else index = "th";

    // Request Section
    time_t reqEnterTime = time(NULL);
    // out_file << to_string(i + 1) << index << " CS Entry Request at " <<
    //                 currTime(reqEnterTime) << " by thread " << to_string(id + 1) << "\n";
    // out_file.flush();

    start = clock();
    Test.lock();
    end = clock();

    // Entry Section - CRITICAL SECTION
    time_t actEnterTime = time(NULL);
    out_file << to_string(i + 1) << index << " CS Entry at " <<
                    currTime(actEnterTime) << " by thread " << to_string(id + 1) << "\n";
    out_file.flush();
    entry_log[th_id].push_back(double(end - start) / double(CLOCKS_PER_SEC));

    // do some work
    sleep(d_t1(gen));

    // Exit Section - CRITICAL SECTION (Request)
    time_t exitTimeReq = time(NULL);
    out_file << to_string(i + 1) << index << " CS Exit Request at " <<
                    currTime(exitTimeReq) << " by thread " << to_string(id + 1) << "\n";
    out_file.flush();

    start = clock();
    Test.unlock();
    end = clock();

    // Exit Section - CRITICAL SECTION (Actual)
    time_t exitTimeAct = time(NULL);
    // out_file << to_string(i + 1) << index << " CS Exit at " <<
    //                 currTime(exitTimeAct) << " by thread " << to_string(id + 1) << "\n";
    // out_file.flush();
    exit_log[th_id].push_back(double(end - start) / double(CLOCKS_PER_SEC));

    // do some work
    sleep(d_t2(gen));
  }
}

void getInput(int* n, int* k, double* lam1, double* lam2) {
  ifstream input;

  input.open("inp-params.txt");
  if(!input.is_open()) {
    cerr<<"Error opening input file"<<'\n';
    exit ( EXIT_FAILURE );
  }
  input >> *n >> *k >> *lam1 >> *lam2;
  input.close();

  return;
}

int main() {
  int n, k; // number of threads, num of CS req
  double lam1, lam2; // lam1 and lam2 are avg of exponential distributions
  getInput(&n, &k, &lam1, &lam2);

  // This is a random number engine class that generates pseudo-random numbers.
  default_random_engine generator;
  // given averages are lam1 and lam2 respectively. The distribution parameter is its inverse.
  exponential_distribution<double> distribution_t1((double)1 / lam1);
  exponential_distribution<double> distribution_t2((double)1 / lam2);

  entry_log = vector<vector<double>> (n);
  exit_log = vector<vector<double>> (n);

  // n threads
  thread *th = new thread[n];
  // Declare a lock object which is accessed from all the threads
  MCS Test;

  // open output file
  out_file.open("MCS.txt");
  if (!out_file.is_open()) {
    cerr<<"Error opening MCS log"<<'\n';
    exit( EXIT_FAILURE );
  }

  // create n threads
  for(int i = 0; i < n; i++) {
    th[i] = thread(testCS, i, k, ref(distribution_t1),
              ref(distribution_t2), ref(generator), ref(Test));
  }
  // join the threads
  for (int i = 0; i < n; i++) {
    th[i].join();
  }

  out_file.close();
  delete [] th;

  double avg_entry = 0, avg_exit = 0;
  for(int i = 0; i < n; i++) {
    for(int j =0; j < entry_log[i].size(); j++) {
      avg_entry += entry_log[i][j];
      avg_exit += exit_log[i][j];
    }
    entry_log[i].clear();
    exit_log[i].clear();
  }

  cout<<"MCS: Average time taken for thread to enter CS: "<<avg_entry / (n*k)<<'\n';
  cout<<"MCS: Average time taken for thread to exit CS: "<<avg_exit / (n*k)<<'\n';

  return 0;
}
