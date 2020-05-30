// condition_variable example
#include <iostream>
#include <cstdio>
#include <fstream>
#include <vector>
#include <ctime>
#include <random> // exp_dist
#include <cstdlib> // EXIT_FAILURE
#include <cstring>
#include <thread>
#include <atomic>
#include <mutex>
#include <condition_variable>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <fcntl.h> // for open
#include <unistd.h> // for close

std::mutex mtx;
std::condition_variable cv;
bool ready = false;

using namespace std;

void boo() {
  while(1) { int x = 1; }
}

void start_servers() {
  std::unique_lock<std::mutex> lck(mtx);
  cout<<"boo\n";
  ready = true;
  while(1)
    cv.notify_all();
}

void server_simulate(int id) {
  cout<<"before: "<<id<<endl;
  // cond wait
  std::unique_lock<std::mutex> lck(mtx);
  while (!ready) cv.wait(lck);
  // spawn three threads
  cout<<"starting: "<<id<<endl;
  thread th_send(boo);
  // recv - inf loop
  thread th_recv(boo);
  // IncrementDriftFactor - inf loop
  thread th_drift(boo);
  th_send.join();
  th_recv.join();
  th_drift.join();
  return;
}

int main() {
  int ntime = 5;
  // create ntime threads for time servers
  thread *th_ts = new thread[ntime];
  for(int i = 0; i < ntime; i++) {
    th_ts[i] = thread(server_simulate, i + 1);
  }
  // threads have been spawned, so release them now
  sleep(1);
  start_servers();
  // join the time server threads
  for (int i = 0; i < ntime; i++) {
    th_ts[i].join();
  }
  delete [] th_ts;
  return 0;
}
