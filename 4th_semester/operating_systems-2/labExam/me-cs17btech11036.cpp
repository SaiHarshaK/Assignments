/*
author: Sai Harsha Kottapalli
 */

#include <iostream>
#include <thread>
#include <fstream>
#include <random>
#include <atomic>
#include <cstdio>
#include <unistd.h>
#include <vector>
#include <cstring>
#include <string>
#include <semaphore.h>
#include <unistd.h>
#include <sys/time.h>
#include <pthread.h>
#include <cstdlib>
#include <time.h>

typedef long long int lli;

using namespace std;

double waiting_time = 0;
int n;
int curr_sess = 0;
bool thread_in_cs = false;
int *wait_sess = NULL;
pthread_cond_t *sess;
pthread_mutex_t lock;
vector<int> sessions;

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

void testCS(int id, int k, int S,
  exponential_distribution<double> &d_cs_time,
  exponential_distribution<double> &d_rm_time,
  default_random_engine &gen) {
  string print_helper;
  string index;
  int str_len;
  for(int i = 0; i < k; i++) {
    // index helper
    if(i == 0) index = "st";
    else if(i == 1) index = "nd";
    else if(i == 2) index = "rd";
    else index = "th";

    int s = id + 1;

    struct timeval req, access;
    gettimeofday(&req, NULL);

    time_t reqEnterTime = time(NULL);
    print_helper = to_string(i+1) + index + " CS Request at " + currTime(reqEnterTime)
                    + " by thread " + to_string(id + 1) + " for session " + to_string(s);

    str_len = print_helper.length();
    char req_char[str_len + 1];
    strcpy(req_char, print_helper.c_str());
    fprintf(log_file,"%s\n", req_char);

    pthread_mutex_lock(&lock);
    wait_sess[s - 1]++;
    if (thread_in_cs) {
      // check if any of the same session threads are waiting
      bool check = true;
      for (int j = 0; j < sessions.size(); j++) {
        if (sessions[j] == s) {
          check = false;
          break;
        }
      }
      if (curr_sess != s && check) { // different session
        sessions.push_back(s);
        pthread_cond_wait(&sess[s - 1], &lock);
      }
    }
    else {
      curr_sess = s;
      // remove the session id from sessions
      for (int j = 0; j < sessions.size(); j++) {
        if (sessions[j] == s) { // remove this session
          sessions.erase(sessions.begin() + j);
          break;
        }
      }
      // unblock all threads with same session
      pthread_cond_broadcast(&sess[s - 1]);
    }
    pthread_mutex_unlock(&lock);
    // Entry Section - CRITICAL SECTION

    thread_in_cs = true;

    time_t actEnterTime = time(NULL);
    gettimeofday(&access, NULL);
    double time_taken = (access).tv_sec - (req).tv_sec;
    time_taken += (double((access).tv_usec) - double((req).tv_usec)) / 1000000;
    pthread_mutex_lock(&lock);
    waiting_time += time_taken;
    pthread_mutex_unlock(&lock);

    print_helper = to_string(i+1) + index + " CS Entry at " +
                    currTime(actEnterTime) + " by thread " + to_string(id + 1) + " for session " + to_string(s);

    str_len = print_helper.length();
    char acc_char[str_len + 1];
    strcpy(acc_char, print_helper.c_str());
    fprintf(log_file,"%s\n", acc_char);

    usleep(d_cs_time(gen)); // Simulation of critical-section

    time_t exitTime = time(NULL);
    print_helper = to_string(i+1) + index + " CS Exit at " +
                    currTime(exitTime) + " by thread " + to_string(id + 1) + " for session " + to_string(s);

    str_len = print_helper.length();
    char exit_char[str_len + 1];
    strcpy(exit_char, print_helper.c_str());
    fprintf(log_file,"%s\n", exit_char);

    pthread_mutex_lock(&lock);
    wait_sess[s - 1]--;
    if (wait_sess[s - 1] == 0) { // we can unblock some other session now
      thread_in_cs = false;
      curr_sess = -1;
      if (sessions.size() > 0) {
        // remove that session[0] from list
        int sess_id = sessions[0];
        sessions.erase(sessions.begin());
        curr_sess = sess_id;
        pthread_cond_broadcast(&sess[sess_id - 1]);
      }
    }
    pthread_mutex_unlock(&lock);
    // Exit Section - CRITICAL SECTION

    // Entry Section - REMAINDER SECTION
    usleep(d_rm_time(gen)); // Simulation of Reminder Section
    // Exit Section - REMAINDER SECTION
  }
}

void getInput(int* k, int *S, int* lam1, int* lam2) {
  ifstream input;
  input.open("inp-params.txt");

  if(!input.is_open()) {
    cerr<<"File does not exist"<<endl;
    exit(1);
  }
  input>>n>>*k>>*S>>*lam1>>*lam2;
  input.close();
  return;
}

int main() {
  int k, S, lam1, lam2; // n is the number of threads, k is the frequency; t1, t2 will be delay values
                        // exponentially distributed with an average of lam1, lam2 seconds

  // process input
  getInput(&k, &S, &lam1, &lam2);
  // convert to micro-seconds
  lam1 *= 1000;
  lam2 *= 1000;
  //create the dynamic waiting array
  wait_sess = new int[S]();
  for (int i = 0; i < S; i++) {
    wait_sess[i] = 0;
  }
  // dynamic conditional variables for s sessions
  sess = new pthread_cond_t[S];
  for (int i = 0; i < S; i++) {
    pthread_cond_init(&sess[i], NULL);
  }
  pthread_mutex_init(&lock, NULL);
  // This is a random number engine class that generates pseudo-random numbers.
  default_random_engine generator;
  // given averages are lam1 and lam2 respectively. The distribution parameter is its inverse.
  exponential_distribution<double> distribution_cs_time((double)1 / lam1);
  exponential_distribution<double> distribution_rm_time((double)1 / lam2);

  // create n threads
  thread *th = new thread[n];
  // open log file
  log_file = fopen("output.txt", "w");

  // call the threads
  for (int i = 0; i < n; i++) {
    th[i] = thread(testCS, i, k, S, ref(distribution_cs_time), ref(distribution_rm_time), ref(generator));
  }
  // join the threads
  for (int i = 0; i < n; i++) {
    th[i].join();
  }

  // destroy the conditional variables
  for (int i = 0; i < S; i++) {
    pthread_cond_destroy(&sess[i]);
  }
  pthread_mutex_destroy(&lock);
  delete [] th;
  delete [] sess;
  delete [] wait_sess;

  cout<<fixed<<"Average waiting time for CME(ms): "<<((double)waiting_time / (n * k)) * 1000<<endl;

  fclose(log_file);
}
