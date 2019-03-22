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
// output files
ofstream log_file;

// helper function to obtain time in HH:MM:SS syntax from the obtained time parameter.
string currTime(time_t time_in) {
  struct tm* clock_time;
  char time[9];
  clock_time = localtime(&time_in);
  sprintf(time, "%.2d:%.2d:%.2d", clock_time->tm_hour, clock_time->tm_min, clock_time->tm_sec);
  return (string)time;
}

void testCS(int id, int k, exponential_distribution<double> &d_cs_time, exponential_distribution<double> &d_rm_time, default_random_engine &gen) {
  string print_helper;
  string index;
  for(int i = 0; i < k; i++) {
    // index helper
    if(i == 0) index = "st";
    else if(i == 1) index = "nd";
    else if(i == 2) index = "rd";
    else index = "th";

    time_t reqEnterTime = time(NULL);
    print_helper = to_string(i+1) + index + " CS Request at " + currTime(reqEnterTime) + " by thread " + to_string(id + 1) + '\n';
    log_file<<print_helper;
    // Entry Section - CRITICAL SECTION
    while(lock.exchange(true, memory_order_acquire))
      ;
    time_t actEnterTime = time(NULL);
    time_t temp = actEnterTime - reqEnterTime;
    waiting_time += temp;
    if(temp > worst_time) worst_time = temp;
    print_helper = to_string(i+1) + index + " CS Entry at " + currTime(actEnterTime) + " by thread " + to_string(id + 1) + '\n';
    log_file<<print_helper;
    sleep(d_cs_time(gen)); // Simulation of critical-section
    time_t exitTime = time(NULL);
    print_helper = to_string(i+1) + index + " CS Exit at " + currTime(exitTime) + " by thread " + to_string(id + 1) + '\n';
    log_file<<print_helper;
    lock.exchange(false, memory_order_release);
    // Exit Section - CRITICAL SECTION
    // Entry Section - REMAINDER SECTION
    sleep(d_rm_time(gen)); // Simulation of Reminder Section
    // Exit Section - REMAINDER SECTION
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
  int n, k, lam1, lam2; // n is the number of threads, k is the frequency; t1, t2 will be delay values
                        // exponentially distributed with an average of lam1, lam2 seconds

  // process input
  getInput(&n, &k, &lam1, &lam2);
  // This is a random number engine class that generates pseudo-random numbers.
  default_random_engine generator;
  // given averages are lam1 and lam2 respectively. The distribution parameter is its inverse.
  exponential_distribution<double> distribution_cs_time((double)1 / lam1);
  exponential_distribution<double> distribution_rm_time((double)1 / lam2);

  // create n threads
  thread *th = new thread[n];
  // open log file
  log_file.open("TAS-Log.txt");

  // call the threads
  for (int i = 0; i < n; i++) {
    th[i] = thread(testCS, i, k, ref(distribution_cs_time), ref(distribution_rm_time), ref(generator));
  }
  // join the threads
  for (int i = 0; i < n; i++) {
    th[i].join();
  }


  log_file<<"Average waiting time to enter CS: "<<(double)waiting_time / (n * k)<<endl;
  log_file<<"Worst case time taken to enter CS: "<<worst_time<<endl;
  log_file.close();
}
