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

// void start_servers() {
//   std::unique_lock<std::mutex> lck(mtx);
//   cout<<"boo\n";
//   ready = true;
//   while(1)
//     cv.notify_all();
// }

// void server_simulate(int id) {
//   cout<<"before: "<<id<<endl;
//   // cond wait
//   std::unique_lock<std::mutex> lck(mtx);
//   while (!ready) cv.wait(lck);
//   // spawn three threads
//   cout<<"starting: "<<id<<endl;
//   thread th_send(boo);
//   // recv - inf loop
//   thread th_recv(boo);
//   // IncrementDriftFactor - inf loop
//   thread th_drift(boo);
//   th_send.join();
//   th_recv.join();
//   th_drift.join();
//   return;
// }

int main() {
  vector<int> bla1;
  vector<int> bla2;
  bla1.push_back(1);
  bla1.push_back(2);
  bla1.push_back(3);
  bla2.push_back(7);
  bla2.push_back(8);
  bla2.push_back(9);
  bla1 = bla2;
  cout<<bla1[2];
  return 0;
}
