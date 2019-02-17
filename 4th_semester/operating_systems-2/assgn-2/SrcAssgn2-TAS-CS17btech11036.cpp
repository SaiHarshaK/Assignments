/*
author: Sai Harsha Kottapalli
About: assignment for operating systems 2. Check ReadMe for instructions.
 */

#include <iostream>
#include <thread>
#include <fstream>
#include <random>
#include <atomic>
#include <cstdio>
#include <unistd.h>
#include <string>
typedef long long int lli;

using namespace std;

atomic<bool> lock = ATOMIC_FLAG_INIT; // for test and set algo
lli waiting_time = 0;
lli worst_time = 0;

// current time
string currTime(time_t time_in) {
  struct tm* clock_time;
  clock_time = localtime(&time_in);
  char time[9];
  sprintf(time, "%.2d:%.2d:%.2d", clock_time->tm_hour, clock_time->tm_min, clock_time->tm_sec);
  return (string)time;
}

void testCS(int id, int k, exponential_distribution<double> &d_cs_time, exponential_distribution<double> &d_rm_time, default_random_engine &gen) {
  string print_helper;
  string index;
  for(int i = 0; i < k; i++) {
    if(i == 0) index = "st";
    else if(i == 1) index = "nd";
    else if(i == 2) index = "rd";
    else index = "th";
    time_t reqEnterTime = time(NULL);
    print_helper = to_string(i+1) + index + " CS Request at " + currTime(reqEnterTime) + " by thread " + to_string(id + 1) + '\n';
    cout<<print_helper;
    while(lock.exchange(true, memory_order_acquire))
      ;
    // Entry Section
    time_t actEnterTime = time(NULL);
    time_t temp = actEnterTime - reqEnterTime;
    waiting_time += temp;
    if(temp > worst_time) worst_time = temp;
    print_helper = to_string(i+1) + index + " CS Entry at " + currTime(actEnterTime) + " by thread " + to_string(id + 1) + '\n';
    cout<<print_helper;
    sleep(d_cs_time(gen)); // Simulation of critical-section
    time_t exitTime = time(NULL);
    print_helper = to_string(i+1) + index + " CS Exit at " + currTime(exitTime) + " by thread " + to_string(id + 1) + '\n';
    cout<<print_helper;
    lock.exchange(false, memory_order_release);
    // Exit Section
    sleep(d_rm_time(gen)); // Simulation of Reminder Section
  }
}

void getInput(int* n, int* k, int* lam1, int* lam2) {
  ifstream input;
  input.open("inp-params.txt");

  if(!input.is_open()) {
    cerr<<"File does not exist"<<endl;
    exit(1);
  }
  input>>*n>>*k>>*lam1>>*lam2;
  input.close();
  return;
}

int main() {
  int n, k, lam1, lam2; // n is the umber of threads, k is the frequency; t1, t2 will be delay values
                        // exponentially distributed with an average of lam1, lam2 seconds

  // process input
  getInput(&n, &k, &lam1, &lam2);
  default_random_engine generator;
  exponential_distribution<double> distribution_cs_time((double)1 / lam1);
  exponential_distribution<double> distribution_rm_time((double)1 / lam2);
  // create n threads
  thread *th = new thread[n];

  for (int i = 0; i < n; i++) {
    th[i] = thread(testCS, i, k, ref(distribution_cs_time), ref(distribution_rm_time), ref(generator));
  }
  for (int i = 0; i < n; i++) {
    th[i].join();
  }

  cout<<waiting_time<<' '<<worst_time<<endl;

  // // output files
  // ofstream log;

  // // print process details at start
  // log.open("RMS-Log.txt");
}
