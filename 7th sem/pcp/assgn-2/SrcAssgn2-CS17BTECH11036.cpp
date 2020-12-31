/*
author: Sai Harsha Kottapalli
About: assignment for Parallel and Concurrent Program. Check ReadMe for instructions.
 */
#include <iostream>
#include <cstdlib> // EXIT_FAILURE
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

// Filter Lock implementation
class FilterLock {
private:
  int* level;
  int* victim;
  int n;
public:
  FilterLock(int n) {
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

  ~FilterLock() {
    delete[] level;
    delete[] victim;
  }
};

// Peterson lock for two threads
class PetersonLock {
private:
  bool* flag;
  int victim;
  int n;
public:
  PetersonLock(int n) {
    flag = new bool[n];
    for(int i = 0; i < n; i++) {
      flag[i] = false;
    }
    this->n = n;
  }

  void lock(int th_id) {
    int me = th_id;
    flag[me] = true;
    victim = me;
    // check if spin conflict
    bool spin = true;
    while(spin) {
      spin = false;
      for(int k = 0; k < n; k++) {
        if(k == me)
          continue;
        // k != me
        if(flag[k])
          spin = true;
      }
      // if there exists some thread(which shares this lock) and is flagged
      // and i am the victim currently, then spin
      spin = spin & (victim == me);
    }
  }

  void unlock(int th_id) {
    int me = th_id;
    flag[me] = false;
  }

  ~PetersonLock() {
    delete[] flag;
  }
};

// Peterson Tree based Lock implementation
class PetersonTreeLock {
private:
  vector<PetersonLock*> tree;
  int n; // assume we have number of threads as power of 2.

  bool isPower2(int n) {
    return n && (!(n&(n-1)));
  }

  int getParent(int i) {
    return (i-1)/2;
  }

  int getLeftChild(int i) {
    return 2*i + 1;
  }

  int getLeftHighest(int i) {
    int node = getLeftChild(i);
    if(node > n - 2)
      return n; // out of bounds, i is leaf node

    // left child exists
    int highest = node;
    while(node < n-1) { // find rightmost child if it exists
      highest = node;
      node = getRightChild(node);
    }
    return highest;
  }

  int getRightChild(int i) {
    return 2*i + 2;
  }

public:
  PetersonTreeLock(int n) {
    // if n is not power of 2, exit
    if(!isPower2(n)) {
      cerr<<"Number of threads: " + to_string(n) + " is not power of 2"<<endl;
      exit(1);
    }
    this->n = n;
    constructTree();
  }

  // the tree is full binary tree as n is power of 2
  void constructTree() {
    tree.push_back(new PetersonLock(n));
    if(n <= 2) {
      return;
    }
    // keep constructing until we make all the nodes in tree
    int start = 0;
    while(tree.size() != n-1) {
      int curr_len = tree.size();
      for(; start < curr_len; start++) { //
        tree.push_back(new PetersonLock(n)); // left node
        tree.push_back(new PetersonLock(n)); // left node
      }
    }
  }

  void lock(int th_id) {
    int me = th_id / 2; // two threads share one lock
    int offset = n-1 - (n/2);
    int leaf_id = offset + me;
    // from leaf to root
    while(getParent(leaf_id) != leaf_id) {
      tree[leaf_id]->lock(th_id);
      leaf_id = getParent(leaf_id);
    }
    // process root
    tree[leaf_id]->lock(th_id);
  }

  void unlock(int th_id) {
    int me = th_id / 2; // two threads share one lock
    int offset = n-1 - (n/2);
    int leaf_id = offset + me;
    // from root to appropriate leaf
    int node = 0;
    while(node < n - 1) {
      tree[node]->unlock(th_id);
      int leftHighest = getLeftHighest(node);
      if(node == leaf_id || leftHighest == n) break;
      if(leaf_id <= leftHighest) {
        node = getLeftChild(node);
      } else {
        node = getRightChild(node);
      }
    }
  }

  ~PetersonTreeLock() {
    // delete tree nodes
    for(int i = 0; i < tree.size(); i++) {
      delete tree[i];
    }
  }
};

// type 0 indicates we are using filter lock, type 1 indicates we are using ptl lock
void testCS(int th_id, int k,
  exponential_distribution<double> &d_t1,
  exponential_distribution<double> &d_t2,
  default_random_engine &gen,
  FilterLock &TestF,
  PetersonTreeLock &TestP,
  bool type) {
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
                    currTime(reqEnterTime) + " by thread " + to_string(id + 1) + " (mesg 1)" + "\n";
    out_file<<print_helper;

    if(type == false) {
      start = clock();
      TestF.lock(id);
      end = clock();
    } else {
      start = clock();
      TestP.lock(id);
      end = clock();
    }

    // Entry Section - CRITICAL SECTION
    time_t actEnterTime = time(NULL);
    print_helper = to_string(i + 1) + index + " CS Entry at " +
                    currTime(actEnterTime) + " by thread " + to_string(id + 1) + " (mesg 2)" + "\n";
    out_file<<print_helper;
    entry_log[th_id].push_back(double(end - start) / double(CLOCKS_PER_SEC));

    // do some work
    sleep(d_t1(gen));

    // Exit Section - CRITICAL SECTION (Request)
    time_t exitTimeReq = time(NULL);
    print_helper = to_string(i + 1) + index + " CS Exit Request at " +
                    currTime(exitTimeReq) + " by thread " + to_string(id + 1) + " (mesg 3)" + "\n";
    out_file<<print_helper;

    if(type == false) {
      start = clock();
      TestF.unlock(id);
      end = clock();
    } else {
      start = clock();
      TestP.unlock(id);
      end = clock();
    }

    // Exit Section - CRITICAL SECTION (Actual)
    time_t exitTimeAct = time(NULL);
    print_helper = to_string(i + 1) + index + " CS Exit at " +
                    currTime(exitTimeAct) + " by thread " + to_string(id + 1) + " (mesg 4)" + "\n";
    out_file<<print_helper;
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
  default_random_engine generatorF;
  // given averages are lam1 and lam2 respectively. The distribution parameter is its inverse.
  exponential_distribution<double> distribution_tF1((double)1 / lam1);
  exponential_distribution<double> distribution_tF2((double)1 / lam2);

  entry_log = vector<vector<double>> (n);
  exit_log = vector<vector<double>> (n);

  // n threads
  thread *th = new thread[n];
  // Filter lock
  // Declare a lock object which is accessed from all the threads
  FilterLock TestF(n);
  PetersonTreeLock TestP(n);

  // open output file
  out_file.open("Filter.txt");
  if (!out_file.is_open()) {
    cerr<<"Error opening Filter log"<<'\n';
    exit( EXIT_FAILURE );
  }

  // create n threads
  for(int i = 0; i < n; i++) {
    th[i] = thread(testCS, i, k, ref(distribution_tF1),
              ref(distribution_tF2), ref(generatorF), ref(TestF), ref(TestP), 0);
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

  cout<<"Filter: Average time taken for thread to enter CS: "<<avg_entry / (n*k)<<'\n';
  cout<<"Filter: Average time taken for thread to exit CS: "<<avg_exit / (n*k)<<'\n';

  // Peterson Tree lock
  // open output file
  out_file.open("PetersonTreeLock.txt");
  if (!out_file.is_open()) {
    cerr<<"Error opening PetersonTreeLock log"<<'\n';
    exit( EXIT_FAILURE );
  }

  // This is a random number engine class that generates pseudo-random numbers.
  default_random_engine generatorP;
  // given averages are lam1 and lam2 respectively. The distribution parameter is its inverse.
  exponential_distribution<double> distribution_tP1((double)1 / lam1);
  exponential_distribution<double> distribution_tP2((double)1 / lam2);

  th = new thread[n];
  // create n threads
  for(int i = 0; i < n; i++) {
    th[i] = thread(testCS, i, k, ref(distribution_tP1),
              ref(distribution_tP2), ref(generatorP), ref(TestF), ref(TestP), 1);
  }
  // join the threads
  for (int i = 0; i < n; i++) {
    th[i].join();
  }

  out_file.close();

  avg_entry = 0, avg_exit = 0;
  for(int i = 0; i < n; i++) {
    for(int j =0; j < entry_log[i].size(); j++) {
      avg_entry += entry_log[i][j];
      avg_exit += exit_log[i][j];
    }
  }
  cout<<"PetersonTreeLock: Average time taken for thread to enter CS: "<<avg_entry / (n*k)<<'\n';
  cout<<"PetersonTreeLock: Average time taken for thread to exit CS: "<<avg_exit / (n*k)<<'\n';

  delete [] th;
  return 0;
}
