/*
Author: Sai Harsha Kottapalli
About: assignment for operating systems 2. Check ReadMe for instructions.
 */

#include <iostream>
#include <thread>
#include <fstream>
#include <random>
#include <mutex>
#include <cstdio>
#include <unistd.h>
#include <sys/time.h>
#include <string>
typedef long long int lli;

using namespace std;

mutex cons, prod, buff; // locks for producer, consumer and buffer
bool *buffer = NULL; // for a dynamic buffer array based on capacity given.
int front_b = -1, back_b = -1;  // for keeping track of locations where
                                // consumers and producers can consume or produce respectively.
double waiting_time_prod = 0;
double waiting_time_cons = 0;
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

void producer(
  int id, int capacity, int rep_p,
  exponential_distribution<double> &d_prod_time,
  default_random_engine &gen
) {
  string print_helper;
  string index;
  for(int i = 0; i < rep_p; i++) {
    // Entry Section
    // index helper
    if(i == 0) index = "st";
    else if(i == 1) index = "nd";
    else if(i == 2) index = "rd";
    else index = "th";

    struct timeval req, access;
    gettimeofday(&req, NULL);

    prod.lock();

    // Critical Section
    // produce if buffer is not full
    // else wait for consumers to consume
    int local_back; // keep track of where item was produced
    while(true) {
      buff.lock();
      if ((front_b == 0 && back_b == capacity - 1) || (back_b == (front_b - 1) % (capacity - 1))) { // buffer is full
        buff.unlock(); // lets a consumer consume.
        continue;
      } else if (front_b == -1) { // first produce
        front_b = 0;
        back_b = 0;
        local_back = back_b;
        buffer[back_b] = 1;
        break;
      } else if ((back_b == capacity -1) && (front_b != 0)) { // produce
        back_b = 0;
        local_back = back_b;
        buffer[back_b] = 1;
        break;
      } else { // produce
        back_b++;
        local_back = back_b;
        buffer[back_b] = 1;
        break;
      }
    }

    // have already produced into the buffer
    time_t produced_t = time(NULL);
    print_helper = to_string(i+1) + index + " item produced by thread " + to_string(id + 1) + " at "
                   + currTime(produced_t) + " into buffer location " + to_string(local_back + 1) + '\n';
    log_file<<print_helper;

    buff.unlock(); // so that the print statements are not jumbled

    gettimeofday(&access, NULL);
    double time_taken = (access).tv_sec - (req).tv_sec;
    time_taken += (double((access).tv_usec) - double((req).tv_usec)) / 1000000;
    waiting_time_prod += time_taken;

    prod.unlock();
    // Remainder Section
    sleep(d_prod_time(gen));
  }
}

void consumer(
  int id, int capacity, int rep_c,
  exponential_distribution<double> &d_cons_time,
  default_random_engine &gen
) {
  string print_helper;
  string index;
  for(int i = 0; i < rep_c; i++) {
    // Entry Section
    // index helper
    if(i == 0) index = "st";
    else if(i == 1) index = "nd";
    else if(i == 2) index = "rd";
    else index = "th";

    struct timeval req, access;
    gettimeofday(&req, NULL);

    cons.lock();
    // Critical Section
    // produce if buffer is not full
    // else wait for consumers to consume
    int local_front; // keep track of where item was consumed
    while(true) {
      buff.lock();
      if (front_b == -1) { // buffer is empty
        buff.unlock(); // lets a producer consume.
        continue;
      } else if (front_b == back_b) { // consume
        local_front = front_b;
        buffer[front_b] = 0;
        front_b = -1;
        back_b = -1;
        break;
      } else if (front_b == capacity - 1) { // consume
        local_front = front_b;
        buffer[front_b] = 0;
        front_b = 0;
        break;
      } else { // consume
        local_front = front_b;
        buffer[front_b] = 0;
        front_b++;
        break;
      }
    }

    // have already produced into the buffer
    time_t consumed_t = time(NULL);
    print_helper = to_string(i+1) + index + " item consumed by thread " + to_string(id + 1) + " at "
                   + currTime(consumed_t) + " into buffer location " + to_string(local_front + 1) + '\n';
    log_file<<print_helper;

    buff.unlock(); // so that the print statements are not jumbled

    gettimeofday(&access, NULL);
    double time_taken = (access).tv_sec - (req).tv_sec;
    time_taken += (double((access).tv_usec) - double((req).tv_usec)) / 1000000;
    waiting_time_cons += time_taken;

    cons.unlock();
    // Remainder Section
    sleep(d_cons_time(gen));
  }
}

void getInput(int* capacity, int* n_p, int* n_c, int* rep_p, int* rep_c, int* lam1, int* lam2) {
  ifstream input;
  input.open("inp-params.txt");

  if(!input.is_open()) {
    cerr<<"File does not exist"<<endl;
    exit(1);
  }
  input>>*capacity>>*n_p>>*n_c>>*rep_p>>*rep_c>>*lam1>>*lam2;
  input.close();
  return;
}

int main() {
  int capacity, n_p, n_c, rep_p, rep_c, lam1, lam2; // capacity is the buffer size
  // n_p -> the number of times a producer loops before terminating. Similarly, consumer
  // exponentially distributed with an average of lam1, lam2 seconds

  // process input
  getInput(&capacity, &n_p, &n_c, &rep_p, &rep_c, &lam1, &lam2);

  //create the dynamic buffer array
  buffer = new bool[capacity]();

  // This is a random number engine class that generates pseudo-random numbers.
  default_random_engine generator;
  // given averages are lam1 and lam2 respectively. The distribution parameter is its inverse.
  exponential_distribution<double> distribution_prod_time((double)1 / lam1);
  exponential_distribution<double> distribution_cons_time((double)1 / lam2);

  // create n_p threads for producers
  thread *th_p = new thread[n_p];

  // create n_c threads for consumers
  thread *th_c = new thread[n_c];

  // open log file
  log_file.open("Lock-Prod_Cons-Log.txt");

  // call the threads for producers
  for (int i = 0; i < n_p; i++) {
    th_p[i] = thread(producer, i, capacity, rep_p, ref(distribution_prod_time), ref(generator));
  }

  // call the threads for consumers
  for (int i = 0; i < n_c; i++) {
    th_c[i] = thread(consumer, i, capacity, rep_c, ref(distribution_cons_time), ref(generator));
  }

  // join the producer threads
  for (int i = 0; i < n_p; i++) {
    th_p[i].join();
  }

  // join the consumer threads
  for (int i = 0; i < n_c; i++) {
    th_c[i].join();
  }

  // delete the dynamic buffer created.
  delete [] buffer;
  buffer = NULL;

  log_file<<fixed<<"Average waiting time for producers: "<<waiting_time_prod / (n_p * rep_p)<<endl;
  log_file<<fixed<<"Average waiting time for consumers: "<<waiting_time_cons / (n_c * rep_c)<<endl;
  log_file.close();
}
