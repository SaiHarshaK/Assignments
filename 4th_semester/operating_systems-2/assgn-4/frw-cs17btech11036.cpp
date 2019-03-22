/*
Author: Sai Harsha Kottapalli
About: assignment for operating systems 2. Check ReadMe for instructions.
 */

#include <iostream>
#include <thread>
#include <fstream>
#include <random>
#include <semaphore.h>
#include <cstdio>
#include <unistd.h>
#include <sys/time.h>
#include <string>
#include <cmath>

typedef long long int lli;

using namespace std;

sem_t in, out, wrt; // locks for writer and reader

double waiting_time_writer = 0;
double waiting_time_reader = 0;

double worst_time_writer = 0;
double worst_time_reader = 0;

int ctrin = 0, ctrout = 0;
bool wait = false;

// output file
ofstream log_file;

// helper function to obtain time in HH:MM:SS syntax from the obtained time parameter.
string currTime(time_t time_in) {
  struct tm* clock_time;
  char time[9];
  clock_time = localtime(&time_in);
  sprintf(time, "%.2d:%.2d:%.2d", clock_time->tm_hour, clock_time->tm_min, clock_time->tm_sec);
  return (string)time;
}

void writer(
  int id, int kw,
  exponential_distribution<double> &d_cs_time,
  exponential_distribution<double> &d_rm_time,
  default_random_engine &gen
) {
  string print_helper;
  string index;
  for (int i = 0; i < kw; i++) {
    // index helper
    if(i == 0) index = "st";
    else if(i == 1) index = "nd";
    else if(i == 2) index = "rd";
    else index = "th";

    struct timeval req, access;
    gettimeofday(&req, NULL);

    time_t reqEnterTime = time(NULL);
    print_helper = to_string(i+1) + index + " CS Request by Writer Thread " +
                    to_string(id + 1) + " at " + currTime(reqEnterTime) + '\n';
    log_file<<print_helper;

    // fair rw semaphore implementation
    sem_wait(&in);
    sem_wait(&out);
    if(ctrin == ctrout)
      sem_post(&out);
    else {
      wait = true;
      sem_post(&out);
      sem_wait(&wrt);
      wait = false;
    }

    // Entry Section - CRITICAL SECTION
    time_t actEnterTime = time(NULL);
    gettimeofday(&access, NULL);
    double time_taken = (access).tv_sec - (req).tv_sec;
    time_taken += (double((access).tv_usec) - double((req).tv_usec)) / 1000000;
    waiting_time_writer += time_taken;
    lli time_taken_usec = floor(time_taken * 1000000);
    if(worst_time_writer < time_taken_usec)
      worst_time_writer = time_taken_usec;

    print_helper = to_string(i+1) + index + " CS Entry by Writer Thread " +
                    to_string(id + 1) + " at " + currTime(actEnterTime) + '\n';
    log_file<<print_helper;

    usleep(d_cs_time(gen)); // Simulation of critical-section

    // Exit Section - CRITICAL SECTION

    time_t exitTime = time(NULL);
    print_helper = to_string(i+1) + index + " CS Exit by Writer Thread " +
                    to_string(id + 1) + " at " + currTime(exitTime) + '\n';
    log_file<<print_helper;

    // release lock
    sem_post(&in);

    // Entry Section - REMAINDER SECTION
    usleep(d_rm_time(gen)); // Simulation of Reminder Section
    // Exit Section - REMAINDER SECTION
  }
}

void reader(
  int id, int kr,
  exponential_distribution<double> &d_cs_time,
  exponential_distribution<double> &d_rm_time,
  default_random_engine &gen
) {
  string print_helper;
  string index;
  for (int i = 0; i < kr; i++) {
    // index helper
    if(i == 0) index = "st";
    else if(i == 1) index = "nd";
    else if(i == 2) index = "rd";
    else index = "th";

    struct timeval req, access;
    gettimeofday(&req, NULL);

    time_t reqEnterTime = time(NULL);
    print_helper = to_string(i+1) + index + " CS Request by Reader Thread " +
                    to_string(id + 1) + " at " + currTime(reqEnterTime) + '\n';
    log_file<<print_helper;

    // fair rw semaphore implementation
    sem_wait(&in);
    ctrin++;
    sem_post(&in);

    // Entry Section - CRITICAL SECTION
    time_t actEnterTime = time(NULL);
    gettimeofday(&access, NULL);
    double time_taken = (access).tv_sec - (req).tv_sec;
    time_taken += (double((access).tv_usec) - double((req).tv_usec)) / 1000000;
    waiting_time_reader += time_taken;
    lli time_taken_usec = floor(time_taken * 1000000);
    if(worst_time_reader < time_taken_usec)
      worst_time_reader = time_taken_usec;

    print_helper = to_string(i+1) + index + " CS Entry by Reader Thread " +
                    to_string(id + 1) + " at " + currTime(actEnterTime) + '\n';
    log_file<<print_helper;

    usleep(d_cs_time(gen)); // Simulation of critical-section

    // Exit Section - CRITICAL SECTION

    time_t exitTime = time(NULL);
    print_helper = to_string(i+1) + index + " CS Exit by Reader Thread " +
                    to_string(id + 1) + " at " + currTime(exitTime) + '\n';
    log_file<<print_helper;

    // release lock
    sem_wait(&out);
    ctrout++;
    if(wait == true && ctrin == ctrout) {
      sem_post(&wrt);
    }
    sem_post(&out);

    // Entry Section - REMAINDER SECTION
    usleep(d_rm_time(gen)); // Simulation of Reminder Section
    // Exit Section - REMAINDER SECTION
  }
}

void getInput(int* nw, int* nr, int* kw, int* kr, lli* lam1, lli* lam2) {
  ifstream input;
  input.open("inp-params.txt");

  if(!input.is_open()) {
    cerr<<"File does not exist"<<endl;
    exit(1);
  }
  input>>*nw>>*nr>>*kw>>*kr>>*lam1>>*lam2;
  input.close();
  return;
}

int main() {
  int nw, nr, kw, kr;// nw - the number of writer threads
  // nr - the number of reader threads
  // kw - the number of times each writer thread tries to enter the CS
  // kr - the number of times each reader thread tries enter the Remainder
  lli lam1, lam2; // exponentially distributed with an average of lam1, lam2 milli-seconds

  // output file
  ofstream avg_times;

  // process input
  getInput(&nw, &nr, &kw, &kr, &lam1, &lam2);
  // convert to micro-seconds
  lam1 *= 1000;
  lam2 *= 1000;

  // This is a random number engine class that generates pseudo-random numbers.
  default_random_engine generator;
  // given averages are lam1 and lam2 respectively. The distribution parameter is its inverse.
  exponential_distribution<double> distribution_cs_time((double)1 / lam1);
  exponential_distribution<double> distribution_rm_time((double)1 / lam2);

  // semaphore init
  sem_init(&in, 0, 1);
  sem_init(&out, 0, 1);
  sem_init(&wrt, 0, 0);

  // create nw threads for writers
  thread *th_w = new thread[nw];

  // create nr threads for readers
  thread *th_r = new thread[nr];

  // open log and avg_times files
  log_file.open("FairRW-Log.txt");
  avg_times.open("Average_time.txt");

  // call the threads for writers
  for (int i = 0; i < nw; i++) {
    th_w[i] = thread(writer, i, kw, ref(distribution_cs_time), ref(distribution_rm_time), ref(generator));
  }

  // call the threads for readers
  for (int i = 0; i < nr; i++) {
    th_r[i] = thread(reader, i, kr, ref(distribution_cs_time), ref(distribution_rm_time), ref(generator));
  }

  // join the producer threads
  for (int i = 0; i < nw; i++) {
    th_w[i].join();
  }

  // join the consumer threads
  for (int i = 0; i < nr; i++) {
    th_r[i].join();
  }

  // semaphore destroy
  sem_destroy(&in);
  sem_destroy(&out);
  sem_destroy(&wrt);

  //close files
  log_file.close();

  avg_times<<fixed<<"Average waiting time for writers(ms): "<<((double)waiting_time_writer / (nw * kw)) * 1000<<endl;
  avg_times<<fixed<<"Average waiting time for readers(ms): "<<((double)waiting_time_reader / (nr * kr)) * 1000<<endl;
  avg_times<<fixed<<"Worst time for writers to enter CS(ms): "<<(double)worst_time_writer / 1000<<endl;
  avg_times<<fixed<<"Worst time for readers to enter CS(ms): "<<(double)worst_time_reader / 1000<<endl;
  avg_times.close();
}
