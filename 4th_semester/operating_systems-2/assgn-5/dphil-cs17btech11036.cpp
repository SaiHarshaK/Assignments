/*
Author: Sai Harsha Kottapalli
About: assignment for operating systems 2. Check ReadMe for instructions.
 */

#include <iostream>
#include <cstdio>
#include <thread>
#include <fstream>
#include <random>
#include <semaphore.h>
#include <pthread.h>
#include <cstdio>
#include <unistd.h>
#include <sys/time.h>
#include <string>
#include <cstring>
#include <cmath>

typedef long long int lli;

using namespace std;

double waiting_time = 0;

lli worst_time = 0;

// output file
FILE* log_file;

// helper function to obtain time in HH:MM:SS syntax from the obtained time parameter.
string currTime(time_t time_in) {
  struct tm* clock_time;
  char time[9];
  clock_time = localtime(&time_in);
  sprintf(time, "%.2d:%.2d:%.2d", clock_time->tm_hour, clock_time->tm_min, clock_time->tm_sec);
  return (string)time;
}

class Dphil {
  private:
    typedef enum phil_state {
      THINKING = 0,
      HUNGRY = 1,
      EATING = 2
    } Phil_state;

    int n_p; // total number of philosophers

    // semaphores with pthreads - one for every philosopher
    pthread_cond_t *self;
    // for monitor like implementation
    pthread_mutex_t monitor;

    Phil_state *state;

    void test(int i) {
      if ((state[(i + (n_p - 1)) % n_p] != EATING) &&
          (state[i] == HUNGRY) &&
          (state[(i + 1) % n_p] != EATING)) {
        state[i] = EATING;
        pthread_cond_signal(&self[i]);
      }

      return;
    }

  public:

    Dphil(int n) {
      n_p = n;

      state = new Phil_state[n];
      for (int i = 0; i < n_p; i++)
        state[i] = THINKING;

      self = new pthread_cond_t[n];
      for (int i = 0; i < n; i++) {
        pthread_cond_init(&self[i], NULL);
      }

      pthread_mutex_init(&monitor, NULL);

      return;
    }

    ~Dphil() {
      for (int i = 0; i < n_p; i++) {
        pthread_cond_destroy(&self[i]);
      }

      pthread_mutex_destroy(&monitor);

      delete [] self;
      delete [] state;

      return;
    }

    void pickup(int i) {
      pthread_mutex_lock(&monitor);
      state[i] = HUNGRY;
      test(i);
      if (state[i] != EATING)
        pthread_cond_wait(&self[i], &monitor);
      pthread_mutex_unlock(&monitor);;

      return;
    }

    void putdown(int i) {
      pthread_mutex_lock(&monitor);
      state[i] = THINKING;
      test((i + (n_p - 1)) % n_p);
      test((i + 1) % n_p);
      pthread_mutex_unlock(&monitor);

      return;
    }

};

void dining(
  int id, int h, int n_p,
  exponential_distribution<double> &d_cs_time,
  exponential_distribution<double> &d_rm_time,
  default_random_engine &gen,
  Dphil &philosophers
) {
  string print_helper;
  string index;
  int str_len;
  for (int i = 0; i < h; i++) {
    // index helper
    if(i == 0) index = "st";
    else if(i == 1) index = "nd";
    else if(i == 2) index = "rd";
    else index = "th";

    struct timeval req, access;
    gettimeofday(&req, NULL);

    time_t reqEnterTime = time(NULL);

    print_helper = to_string(i + 1) + index + " eat request by Thread " +
                    to_string(id + 1) + " at " + currTime(reqEnterTime);

    str_len = print_helper.length();
    char req_char[str_len + 1];
    strcpy(req_char, print_helper.c_str());
    fprintf(log_file,"%s\n", req_char);

    philosophers.pickup(id);

    // Entry Section - CRITICAL SECTION (EAT time)
    time_t actEnterTime = time(NULL);
    gettimeofday(&access, NULL);
    double time_taken = (access).tv_sec - (req).tv_sec;
    time_taken += (double((access).tv_usec) - double((req).tv_usec)) / 1000000;
    waiting_time += time_taken;
    lli time_taken_usec = floor(time_taken * 1000000);
    if(worst_time < time_taken_usec)
      worst_time = time_taken_usec;

    print_helper = to_string(i+1) + index + " CS Entry by Philosopher Thread " +
                    to_string(id + 1) + " at " + currTime(actEnterTime);

    str_len = print_helper.length();
    char acc_char[str_len + 1];
    strcpy(acc_char, print_helper.c_str());
    fprintf(log_file,"%s\n", acc_char);

    usleep(d_cs_time(gen)); // Simulation of critical-section (EAT time)

    // Exit Section - CRITICAL SECTION (EAT time)

    time_t exitTime = time(NULL);
    print_helper = to_string(i+1) + index + " CS Exit by Philosopher Thread " +
                    to_string(id + 1) + " at " + currTime(exitTime);

    str_len = print_helper.length();
    char exit_char[str_len + 1];
    strcpy(exit_char, print_helper.c_str());
    fprintf(log_file,"%s\n", exit_char);

    philosophers.putdown(id);

    // Entry Section - REMAINDER SECTION (THINK time)
    usleep(d_rm_time(gen)); // Simulation of Reminder Section (THINK time)
    // Exit Section - REMAINDER SECTION (THINK time)
  }
}

void getInput(int* n, int* h, lli* lam1, lli* lam2) {
  ifstream input;
  input.open("inp-params.txt");

  if(!input.is_open()) {
    cerr<<"File does not exist"<<endl;
    exit(1);
  }
  input>>*n>>*h>>*lam1>>*lam2;
  input.close();
  return;
}

int main() {
  int n, h; // n - number of philosopher threads
  // h - number of times each philosopher thread tries to enter the CS
  lli lam1, lam2;// exponentially distributed with an average of lam1, lam2 milli-seconds

  // output file
  ofstream avg_times;

  // process input
  getInput(&n, &h, &lam1, &lam2);
  // convert to micro-seconds
  lam1 *= 1000;
  lam2 *= 1000;

  // This is a random number engine class that generates pseudo-random numbers.
  default_random_engine generator;
  // given averages are lam1 and lam2 respectively. The distribution parameter is its inverse.
  exponential_distribution<double> distribution_cs_time((double)1 / lam1);
  exponential_distribution<double> distribution_rm_time((double)1 / lam2);

  // initialize dining philosopher monitor variant
  Dphil philosophers(n);

  // create n threads for philosophers
  thread *th_p = new thread[n];

  // open log and avg_times files
  log_file = fopen("dphil-log.txt", "w");
  avg_times.open("Times.txt");

  // call the threads for writers
  for (int i = 0; i < n; i++) {
    th_p[i] = thread(dining, i, h, n, ref(distribution_cs_time), ref(distribution_rm_time), ref(generator), ref(philosophers));
  }

  // join the producer threads
  for (int i = 0; i < n; i++) {
    th_p[i].join();
  }

  //close files
  fclose(log_file);

  avg_times<<fixed<<"Average waiting time for philosophers(ms): "<<((double)waiting_time / (n * h)) * 1000<<endl;
  avg_times<<fixed<<"Worst time taken for philosopher to eat(ms): "<<(double)worst_time / 1000<<endl;
  avg_times.close();
}
