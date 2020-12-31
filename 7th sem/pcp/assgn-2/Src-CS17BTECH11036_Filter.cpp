/*
author: Sai Harsha Kottapalli
About: assignment for Parallel and Concurrent Program. Check ReadMe for instructions.
 */
#include <iostream>
#include <fstream>
#include <random>
#include <string>
#include <thread>
#include <unistd.h>

using namespace std;

// output files
FILE *out_file;
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

// Filter Lock implementation
class Lock {
private:
  int* level;
  int* victim;
  int n;
public:
  Lock(int n) {
    this->n = n;
    level = new int[n];
    victim = new int[n];
    for(int i = 0; i < n; i++) {
      level[i] = 0;
    }
  }

  void lock(int th_id) {
    int me = th_id;
    for(int i = 1; i < n; i++) {
      level[me] = i;
      victim[i] = me;
      // spin if conflict
      bool spin = true;
      while(spin) {
        spin = false;
        for(int k = 0; k < n; k++) {
          if(k == me)
            continue;
          // k != me
          if(level[k] >= i && victim[i] == me)
            spin = true;
        }
      }
    }
  }

  void unlock(int th_id) {
    int me = th_id;
    level[me] = 0;
  }

  ~Lock() {
    delete[] level;
    delete[] victim;
  }
};

void testCS(int th_id, int k,
  exponential_distribution<double> &d_t1,
  exponential_distribution<double> &d_t2,
  default_random_engine &gen,
  Lock &Test) {
  int id = th_id;
  string print_helper, index;
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
    print_helper = to_string(i + 1) + index + " CS Request at " +
                    currTime(reqEnterTime) + " by thread " + to_string(id + 1);
    fprintf(out_file, "%s\n", print_helper.c_str());
    fflush(out_file);

    start = clock();
    Test.lock(id);
    end = clock();

    // Entry Section - CRITICAL SECTION
    time_t actEnterTime = time(NULL);
    print_helper = to_string(i + 1) + index + " CS Entry at " +
                    currTime(actEnterTime) + " by thread " + to_string(id + 1);
    fprintf(out_file, "%s\n", print_helper.c_str());
    fflush(out_file);
    entry_log[th_id].push_back(double(end - start) / double(CLOCKS_PER_SEC));

    // do some work
    sleep(d_t1(gen));

    // Exit Section - CRITICAL SECTION (Request)
    time_t exitTimeReq = time(NULL);
    print_helper = to_string(i + 1) + index + " CS Exit Request at " +
                    currTime(exitTimeReq) + " by thread " + to_string(id + 1);
    fprintf(out_file, "%s\n", print_helper.c_str());
    fflush(out_file);

    start = clock();
    Test.unlock(id);
    end = clock();

    // Exit Section - CRITICAL SECTION (Actual)
    time_t exitTimeAct = time(NULL);
    print_helper = to_string(i + 1) + index + " CS Exit at " +
                    currTime(exitTimeAct) + " by thread " + to_string(id + 1);
    fprintf(out_file, "%s\n", print_helper.c_str());
    fflush(out_file);
    exit_log[th_id].push_back(double(end - start) / double(CLOCKS_PER_SEC));

    // do some work
    sleep(d_t2(gen));
  }
}

void getInput(int* n, int* k, double* lam1, double* lam2) {
  ifstream input;

  input.open("inp-params.txt");
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
  Lock Test(n);

  // open output file
  out_file = fopen("Filter.txt", "w");

  // create n threads
  for(int i = 0; i < n; i++) {
    th[i] = thread(testCS, i, k, ref(distribution_t1),
              ref(distribution_t2), ref(generator), ref(Test));
  }
  // join the threads
  for (int i = 0; i < n; i++) {
    th[i].join();
  }

  fclose(out_file);

  double avg_entry = 0, avg_exit = 0;
  for(int i = 0; i < n; i++) {
    for(int j =0; j < entry_log[i].size(); j++) {
      avg_entry += entry_log[i][j];
      avg_exit += exit_log[i][j];
    }
  }

  cout<<"Average time taken for thread to enter CS: "<<avg_entry / (n*k)<<'\n';
  cout<<"Average time taken for thread to exit CS: "<<avg_exit / (n*k)<<'\n';

  delete [] th;
  return 0;
}
