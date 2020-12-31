/*
author: Sai Harsha Kottapalli
About: assignment for Parallel and Concurrent Program. Check ReadMe for instructions.
 */
#include <iostream>
#include <cmath>
#include <fstream>
#include <ctime>
#include <cstdlib> // EXIT_FAILURE
#include <thread>
#include <mutex>

using namespace std;

// output files
FILE *log_file_dam, *log_file_sam1, *log_file_sam2, *log_file_times;

class Counter {
private:
  int i = 1;
  std::mutex incrementer;
public:
  int getAndIncrement() {
    int val;
    incrementer.lock();
    i++;
    val = i-1;
    incrementer.unlock();
    return val;
  }
};

// global counter all threads can take values from
Counter counter;

// standard prime number checking algorithm
bool isPrime(int n) {
  if (n <= 1)
    return false;

  // Check from 2 to n-1
  for (int i = 2; i*i <= n; i++)
    if (n % i == 0)
      return false;

  return true;
}

void print_dam(int i) {
  fprintf(log_file_dam, "%d ", i);
}

void primePrintDAM(int n) {
  long i = counter.getAndIncrement();
  long limit = pow(10, n);
  while (i < limit) {
    // loop until all numbers taken
    if (isPrime(i))
      print_dam(i);
    i = counter.getAndIncrement(); // take next untaken number
  }
}

void print_sam1(int i) {
  fprintf(log_file_sam1, "%d ", i);
}

void primePrintSAM1(int th_id, int n, int m) {
  long i = 1 + th_id;
  long limit = pow(10, n);
  for (int j = i; j <= limit; j += m) {
    if(isPrime(j))
      print_sam1(j);
  }
}

void print_sam2(int i) {
  fprintf(log_file_sam2, "%d ", i);
}

void primePrintSAM2(int th_id, int n, int m) {
  th_id += 1; // index 1 based
  long i = 2*th_id - 1;
  long limit = pow(10, n);
  int j = i; // starting point for all threads
  if(th_id == 1) { // we know that 1 is not prime but 2 is. so 1st thread starts with 2, rest from odd numbers(>= 3)
    if(isPrime(2))
      print_sam2(2);
    j = 1 + 2*m; // for first thread next number will be 1 + 2m
  }
  for (; j <= limit; j += 2*m) { // m numbers handled by other threads and m numbers are skipped
    if(isPrime(j))
      print_sam2(j);
  }
}

void getInput(int* n, int* m) {
  ifstream input;

  input.open("inp-params.txt");
  input >> *n >> *m;
  input.close();

  return;
}

int main() {
  int m, n; // number of numbers to check and threads, N = 10^n
  getInput(&n, &m);
  // m threads
  thread *th = new thread[m];

  // open log file
  log_file_times = fopen("Times.txt", "w");

  // code for DAM starts here
  log_file_dam = fopen("Primes-DAM.txt", "w");

  // get start timestamp(DAM) so that we can use it relative to others
  timespec start_time;
  if(clock_gettime(CLOCK_REALTIME, &start_time) == -1 ) {
    cerr << "clock_gettime failed" << endl;
    exit( EXIT_FAILURE );
  }

  // create m threads
  for(int i = 0; i < m; i++) {
    th[i] = thread(primePrintDAM, n);
  }
  // join the threads
  for (int i = 0; i < m; i++) {
    th[i].join();
  }

  timespec end_time;
  if(clock_gettime(CLOCK_REALTIME, &end_time) == -1 ) {
    cerr << "clock_gettime failed" << endl;
    exit( EXIT_FAILURE );
  }
  fclose(log_file_dam);

  // calculate time taken
  fprintf(log_file_times,"%lf ", (end_time.tv_sec - start_time.tv_sec) + 1.0e-9*(end_time.tv_nsec - start_time.tv_nsec));

  // code for DAM ends here

  // code for SAM1 starts here

  // open log file
  log_file_sam1 = fopen("Primes-SAM1.txt", "w");

  // get start timestamp(SAM1) so that we can use it relative to others
  if(clock_gettime(CLOCK_REALTIME, &start_time) == -1 ) {
    cerr << "clock_gettime failed" << endl;
    exit( EXIT_FAILURE );
  }

  // create m threads
  for(int i = 0; i < m; i++) {
    th[i] = thread(primePrintSAM1, i, n, m);
  }
  // join the threads
  for (int i = 0; i < m; i++) {
    th[i].join();
  }

  if(clock_gettime(CLOCK_REALTIME, &end_time) == -1 ) {
    cerr << "clock_gettime failed" << endl;
    exit( EXIT_FAILURE );
  }
  fclose(log_file_sam1);

  // calculate time taken
  fprintf(log_file_times,"%lf ", (end_time.tv_sec - start_time.tv_sec) + 1.0e-9*(end_time.tv_nsec - start_time.tv_nsec));

  // code for SAM1 ends here

  // code for SAM2 starts here

  // open log file
  log_file_sam2 = fopen("Primes-SAM2.txt", "w");

  // get start timestamp(SAM1) so that we can use it relative to others
  if(clock_gettime(CLOCK_REALTIME, &start_time) == -1 ) {
    cerr << "clock_gettime failed" << endl;
    exit( EXIT_FAILURE );
  }

  // create m threads
  for(int i = 0; i < m; i++) {
    th[i] = thread(primePrintSAM2, i, n, m);
  }
  // join the threads
  for (int i = 0; i < m; i++) {
    th[i].join();
  }

  if(clock_gettime(CLOCK_REALTIME, &end_time) == -1 ) {
    cerr << "clock_gettime failed" << endl;
    exit( EXIT_FAILURE );
  }
  fclose(log_file_sam2);

  // calculate time taken
  fprintf(log_file_times,"%lf ", (end_time.tv_sec - start_time.tv_sec) + 1.0e-9*(end_time.tv_nsec - start_time.tv_nsec));

  // code for SAM2 ends here

  fclose(log_file_times);
  delete [] th;
  return 0;
}
