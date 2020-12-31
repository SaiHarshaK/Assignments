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
#include <set>

using namespace std;

// output files
FILE *out_file;
// storing times
vector<double> time_log;

class REG {
private:
  int pid;
  int val;
  int sn;
public:
  REG() { // basic constructor for sanity check
    pid = 0;
    val = 0;
    sn = 0;
  }

  REG(int val) { // basic constructor for sanity check
    pid = 0;
    this->val = val;
    sn = 0;
  }

  REG(int pid, int val, int sn) {
    this->pid = pid;
    this->val = val;
    this->sn = sn;
  }

  int getPID() {
    return pid;
  }

  int getValue() {
    return val;
  }

  int getSn() {
    return sn;
  }
};

class MRMWSnap {
private:
  int m, n;
  vector<int> sn;
  vector<atomic<REG*>*> REGS; // array of MRMW registers
  vector<atomic<int*>*> HELPSNAP; // array of MRSW registers

  vector<REG> collect() {
    vector<REG> copy(m);
    for(int i = 0; i < m; i++) {
      copy[i] = *((*REGS[i]).load());
    }
    return copy;
  }

  bool compare(REG& a, REG& b) {
    return (a.getValue() == b.getValue()) && (a.getSn() == b.getSn()) && (a.getPID() == b.getPID());
  }
public:
  MRMWSnap(int m, int n, int init=-1) {
    this->m = m;
    this->n = n;
    for(int i = 0; i < m; i++) {
      atomic<REG*> *atom = new atomic<REG*>();
      atom->store(new REG(init));
      REGS.push_back(atom);
    }
    for(int i = 0; i < n; i++) {
      atomic<int*> *atom = new atomic<int*>();
      atom->store(NULL);
      HELPSNAP.push_back(atom);
    }
    sn = vector<int>(n, -1);
  }

  int* snapshot() {
    set<int> can_help;
    vector<REG> aa;
    vector<REG> bb;
    aa = collect();
    bool repeat = false;
    collectLabel:
      while(true) {
        bb = collect();
        for(int j = 0; j < m; j++) {
          if(!compare(aa[j], bb[j])) {
            repeat = true;
            int pid = bb[j].getPID();
            if(can_help.find(pid) != can_help.end()) {
              // use helpsnap[pid]
              // we make a copy here so that on replace we dont erase copy of this snap in other HELPSNAPS
              int* result = new int[m];
              for(int j = 0; j < m; j++) {
                result[j] = (*HELPSNAP[pid])[j];
              }
              return result;
            } else {
              can_help.insert(pid);
            }
          }
        }
        if(repeat) {
          repeat = false;
          continue;
        }
        int* result = new int[m];
        for(int j = 0; j < m; j++) {
          result[j] = bb[j].getValue();
        }
        return result;
      }
  }

  void update(int th_id, int x, int val) {
    sn[th_id] = sn[th_id] + 1;
    REG* oldValuePtr = (*REGS[x]).load();
    REG* newValue = new REG(th_id, val, sn[th_id]);
    *REGS[x] = newValue;
    int* snap = snapshot();
    int* oldSnap = (*HELPSNAP[th_id]).load();
    *HELPSNAP[th_id] = snap;
    // // free up oldValues
    // if(oldSnap != NULL)
    //   delete[] oldSnap;
    // delete oldValuePtr;
  }

  ~MRMWSnap() {
    for(int i = 0; i < m; i++) {
      delete *REGS[i];
      delete REGS[i];
    }
    // destroy helpsnap
    for(int i = 0; i < n; i++) {
      if(*HELPSNAP[i] != NULL)
        delete[] *HELPSNAP[i];
      delete[] HELPSNAP[i];
    }
  }
};

// Create a snapshot object of size M to be initilised later
MRMWSnap* MRMWSnapObj;

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

void writer(int th_id, int max, int m,
  exponential_distribution<double> &d,
  default_random_engine &gen) {
  int pid = th_id, v, i;
  string print_helper;
  while(!term) { // Execute until term flag is set to true
    i = rand() % m; // Get a random location in the range 1..m
    v = rand() % max; // Get a random integer value in 1..max
    MRMWSnapObj->update(th_id, i, v);

    time_t currTimeVal = time(NULL);
    print_helper = "Thr" + to_string(pid + 1) + "'s write of " + to_string(v) +
                  " on location " + to_string(i+1) + " at " + currTime(currTimeVal);
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
    int* snap = MRMWSnapObj->snapshot(); // collect the snapshot
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

  // Initialization of shared variables
  MRMWSnapObj = new MRMWSnap(m, n);

  // n writers
  thread *th = new thread[n], snapshotter;

  // open output file
  out_file = fopen("MRMW-Snap.txt", "w");

  // create n threads
  for(int i = 0; i < n; i++) {
    th[i] = thread(writer, i, n*k*m, m, ref(distribution_w), ref(generator));
  }

  snapshotter = thread(snapshot, k, m, ref(distribution_r), ref(generator));
  snapshotter.join();

  term = true; // Inform all the writer threads that they have to terminate

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

  delete MRMWSnapObj;
  delete [] th;
  return 0;
}
