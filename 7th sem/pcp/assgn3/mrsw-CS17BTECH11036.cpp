/*
author: Sai Harsha Kottapalli
About: assignment for Parallel and Concurrent Program. Check ReadMe for instructions.
 */
#include <iostream>
#include <cstdlib> // RAND_MAX, rand, srand
#include <ctime> // time
#include <fstream>
#include <random>
#include <string>
#include <thread>
#include <unistd.h>
#include <atomic>

using namespace std;

// output files
FILE *out_file;
// storing times
vector<double> time_log;

class StampedSnap {
private:
  int stamp;
  int value;
  int* snap;
public:
  StampedSnap() { // basic constructor for sanity check
    stamp = 0;
    value = 0;
    snap = NULL;
  }

  StampedSnap(int val) {
    stamp = 0;
    this->value = val;
    snap = NULL;
  }

  StampedSnap(int label, int val, int* snap) {
    stamp = label;
    this->value = val;
    this->snap = snap;
  }

  int getStamp() {
    return stamp;
  }

  int getValue() {
    return value;
  }

  int* getSnap() {
    return snap;
  }

  void delSnap() {
    if(snap != NULL) {
      delete[] snap;
      snap = NULL;
    }
  }
};

class MRSWSnap {
private:
  int m;
  vector<atomic<StampedSnap*>*> a_table; // array of MRSW registers

  vector<StampedSnap> collect() {
    vector<StampedSnap> copy(m);
    for(int i = 0; i < m; i++) {
      copy[i] = *((*a_table[i]).load());
    }
    return copy;
  }
public:
  MRSWSnap(int m, int init=-1) {
    this->m = m;
    for(int i = 0; i < m; i++) {
      atomic<StampedSnap*> *atom = new atomic<StampedSnap*>();
      atom->store(new StampedSnap(init));
      a_table.push_back(atom);
    }
  }

  int* snapshot() {
    vector<StampedSnap> oldCopy;
    vector<StampedSnap> newCopy;
    vector<bool> moved(m, false);
    oldCopy = collect();
    collectLabel:
      while(true) {
        newCopy = collect();
        for(int j = 0; j < m; j++) {
          if(oldCopy[j].getStamp() != newCopy[j].getStamp()) {
            if(moved[j]) {
              return newCopy[j].getSnap();
            } else {
              moved[j] = true;
              oldCopy = newCopy;
              goto collectLabel;
            }
          }
        }
        int* result = new int[m];
        for(int j = 0; j < m; j++) {
          result[j] = newCopy[j].getValue();
        }
        return result;
      }
  }

  void update(int th_id, int val) {
    int* snap = snapshot();
    StampedSnap oldValue = *((*a_table[th_id]).load());
    StampedSnap* oldValuePtr = (*a_table[th_id]).load();
    StampedSnap* newValue = new StampedSnap(oldValue.getStamp() + 1, val, snap);
    *a_table[th_id] = newValue;
    // // free up oldValue
    // oldValue.delSnap();
    // delete oldValuePtr;
  }

  ~MRSWSnap() {
    for(int i = 0; i < m; i++) {
      StampedSnap ss = *(*a_table[i]).load();
      // ss.delSnap();
      // delete *a_table[i];
      // delete a_table[i];
    }
  }
};

// Create a snapshot object of size M to be initilised later
MRSWSnap* MRSWSnapObj;

// A variable to inform the writer threads they have to terminate
atomic<bool> term(false);

// helper function to obtain time in HH:MM:SS syntax from the obtained time parameter.
string currTime(time_t time_in) {
  struct tm* clock_time;
  char time[9];
  clock_time = localtime(&time_in);
  sprintf(time, "%.2d:%.2d:%.2d", clock_time->tm_hour, clock_time->tm_min, clock_time->tm_sec);
  return (string)time;
}

void writer(int th_id, int max,
  exponential_distribution<double> &d,
  default_random_engine &gen) {
  int pid = th_id, v;
  string print_helper;
  while(!term) {
    v = rand() % max;
    MRSWSnapObj->update(th_id, v);

    time_t currTimeVal = time(NULL);
    print_helper = "Thr" + to_string(pid + 1) + "'s write of " + to_string(v) + " at " + currTime(currTimeVal);
    fprintf(out_file, "%s\n", print_helper.c_str());

    // do some work
    usleep(d(gen) * 1e6);
  }
}

void snapshot(int k, int m,
  exponential_distribution<double> &d,
  default_random_engine &gen) {
  string print_helper;
  clock_t beginCollect, endCollect;
  for(int i = 0; i < k; i++) {
    beginCollect = clock();
    int* snap = MRSWSnapObj->snapshot();
    endCollect = clock();
    double time_taken = double(endCollect - beginCollect) / double(CLOCKS_PER_SEC);
    time_log.push_back(time_taken);

    time_t currTimeVal = time(NULL);
    print_helper = "Snapshot Thr's snapshot: ";
    for(int j = 0; j < m; j++) {
      print_helper += "l" + to_string(j+1) + "-" + to_string(snap[j]) + " ";
    }
    delete[] snap;
    print_helper += "which finished at " + currTime(currTimeVal) + " and ran for " + to_string(time_taken) + " seconds";
    fprintf(out_file, "%s\n", print_helper.c_str());

    // do some work
    usleep(d(gen) * 1e6);
  }
}

void getInput(int* n, int* m, double* mew_w, double* mew_r, int* k) {
  ifstream input;

  input.open("inp-params.txt");
  input >> *n >> *m >> *mew_w >> *mew_r >> *k;
  input.close();

  return;
}

int main() {
  srand(time(NULL));

  int n, m, k; // number of threads, number of registers and number of snapshots
  double mew_w, mew_r; // mew_w and mew_r are avg of exponential distributions for writer and snapshot thread
  getInput(&n, &m, &mew_w, &mew_r, &k);

  // This is a random number engine class that generates pseudo-random numbers.
  default_random_engine generator;
  // given averages are lam1 and lam2 respectively. The distribution parameter is its inverse.
  exponential_distribution<double> distribution_w((double)1 / mew_w);
  exponential_distribution<double> distribution_r((double)1 / mew_r);

  MRSWSnapObj = new MRSWSnap(m);

  // n writers
  thread *th = new thread[n], snapshotter;

  // open output file
  out_file = fopen("MRSW-Snap.txt", "w");

  // create n threads
  for(int i = 0; i < n; i++) {
    th[i] = thread(writer, i, n*k*m, ref(distribution_w), ref(generator));
  }

  snapshotter = thread(snapshot, k, m, ref(distribution_r), ref(generator));
  snapshotter.join();

  term = true;

  // join the threads
  for (int i = 0; i < n; i++) {
    th[i].join();
  }

  fclose(out_file);

  double avg_time = 0, worst_time = 0;
  for(int j = 0; j < time_log.size(); j++) {
    avg_time += time_log[j];
    worst_time = max(worst_time, time_log[j]);
  }

  cout<<"Average time taken for snapshot: "<<avg_time / ((double)k)<<'\n';
  cout<<"Worst case time taken for snapshot: "<<worst_time<<'\n';

  delete MRSWSnapObj;
  delete [] th;
  return 0;
}
