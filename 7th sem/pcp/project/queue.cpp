/*
author: Sai Harsha Kottapalli
About: assignment for Parallel and Concurrent Program. Check ReadMe for instructions.
 */
#include <atomic>
#include <vector>
#include <iostream>
#include <cstdlib> // EXIT_FAILURE
#include <ctime>
#include <climits>
#include <fstream>
#include <random>
#include <string>
#include <thread>
#include <unistd.h>
#include <mutex>

using namespace std;
std::mutex m;

// #define DEBUG_MODE 1

// output files
FILE *out_file;
// storing times
vector<vector<double>> entry_log;

// helper function to obtain time in HH:MM:SS syntax from the obtained time parameter.
string currTime(time_t time_in) {
  struct tm* clock_time;
  char time[9];
  clock_time = localtime(&time_in);
  sprintf(time, "%.2d:%.2d:%.2d", clock_time->tm_hour, clock_time->tm_min, clock_time->tm_sec);
  return (string)time;
}

// QNode
class Node {
public:
  atomic<bool> empty; // Flag
  int data;
  atomic<Node*> next;
};

atomic<int> c, c1;

class Queue {
public:
  Node* head = NULL;
  Node* tail = NULL;

  // Queue initialization
  Queue(int k) {
    // create k dummy nodes for fast init
    for(int i = 0; i < k; i++) {
      Node* newNode = new Node();
      newNode->data = 0;
      newNode->empty = true;
      newNode->next = NULL;
      if (i == 0) {
        head = newNode;
      } else {
        tail->next = newNode; // previous node shall point to this new node.
      }
      tail = newNode;
    }
    tail->next = head; // now cicular queue is complete
    tail = head; // for init, both tail and head should point to same node
    FullQueueCount = 0;
  }

  bool enqueue(int data, int th_id) {
    // DEBUG
    #ifndef DEBUG_MODE
      string helper;
      time_t enterTime = time(NULL);
      helper = to_string(th_id + 1) + " thread was called to do enqueue " + to_string(data) + " at " +
                      currTime(enterTime);
      fprintf(out_file, "%s\n", helper.c_str());
      fflush(NULL);
    #endif
    bool localFirstTime = true;
    Node* localTail = tail; //localTail is local
    while(true) {
      // Try any dummy node
      bool VTRUE = true;
      if(localTail->empty.compare_exchange_strong(VTRUE, false)) {
        // if tail points to empty dummy node
        localTail->data = data;
        c++;
        // DEBUG
        #ifndef DEBUG_MODE
          string helper, h1;
          time_t enterTime = time(NULL);
          helper = to_string(th_id + 1) + " thread will do enqueue(1-1) " + to_string(data) + " at " +
                          currTime(enterTime);
              h1 = "";
              Node* temp = head;
              while(temp->next != head) {
                if(temp->empty == true)
                  break;
                h1 += " " + to_string(temp->data) + " ";
                temp = temp->next;
              }
              fprintf(out_file, "%s %s\n", helper.c_str(), h1.c_str());
          fflush(NULL);
        #endif

        while(tail != localTail) {// if previous enqueue is still ongoing, wait for it to finish
          cout<<to_string(tail->data) + " " + to_string(localTail->data) + " wait enq 1\n";
        }
        tail = localTail->next;

        // DEBUG
        #ifndef DEBUG_MODE
          enterTime = time(NULL);
          helper = to_string(th_id + 1) + " thread is doing enqueue(1-2) " + to_string(data) + " at " +
                          currTime(enterTime);
              h1 = "";
              temp = head;
              while(temp->next != head) {
                if(temp->empty == true)
                  break;
                h1 += " " + to_string(temp->data) + " ";
                temp = temp->next;
              }
              fprintf(out_file, "%s %s\n", helper.c_str(), h1.c_str());
          fflush(NULL);
        #endif

        return true; // as enqueue has ended successfully
      } else { // a concurrent enqueue has successfully enqueued, so this has to try the next dummy node
        Node* prevLocalTail = localTail;
        localTail = localTail->next;
        Node* newNode;
        while(localTail == head) {
          //No more empty dummy nodes and queue is full,then create a new node
          if(localFirstTime == true) {
            localFirstTime = false;
            newNode = new Node();
            newNode->data = data;
            newNode->empty = true;
            newNode->next = NULL;
          }
          newNode->next = head;
          Node* tempNode = newNode->next;
          if(prevLocalTail->next.compare_exchange_strong(tempNode, newNode)) {
            //Successful CAS and node is connected

            // DEBUG
            #ifndef DEBUG_MODE
              string helper, h1;
              time_t enterTime = time(NULL);
              helper = to_string(th_id + 1) + " thread will do enqueue(2-1) " + to_string(data) + " at " +
                              currTime(enterTime);
              h1 = "";
              Node* temp = head;
              while(temp->next != head) {
                if(temp->empty == true)
                  break;
                h1 += " " + to_string(temp->data) + " ";
                temp = temp->next;
              }
              fprintf(out_file, "%s %s\n", helper.c_str(), h1.c_str());
              fflush(NULL);
            #endif

            while(tail != prevLocalTail)
              cout<<to_string(tail->data) + " " + to_string(prevLocalTail->data) + " wait enq 2\n";
            ;
            tail = newNode;

            // DEBUG
            #ifndef DEBUG_MODE
              enterTime = time(NULL);
              helper = to_string(th_id + 1) + " thread is doing enqueue(2-2) " + to_string(data) + " at " +
                              currTime(enterTime);
              fprintf(out_file, "%s\n", helper.c_str());
              fflush(NULL);
            #endif

            return true; // as enqueue has ended successfully
          } else {
            prevLocalTail = prevLocalTail->next; // a concurrent enq overtook
          }
        }
      }
    }
    // the below line is not recheable
    return false;
  }

  int dequeue(int th_id) {
    Node* localHead = head;
    while(true) {
      // Now if localHead points to non Emptynode
      bool VFALSE = false;
      if(localHead->empty.compare_exchange_strong(VFALSE, true)) {
        c1++;
        int data = localHead->data;
        while(localHead != head)
          cout<<"wait deq 1\n"; // wait
        head = localHead->next;

        // DEBUG
        #ifndef DEBUG_MODE
          string helper;
          time_t enterTime = time(NULL);
          helper = to_string(th_id + 1) + " thread is doing dequeue " + to_string(data) + " at " +
                          currTime(enterTime);
          fprintf(out_file, "%s\n", helper.c_str());
          fflush(NULL);
        #endif

        return data;
      } else {
        //If CAS fails because of a concurrent successful dequeue,try the next node
        localHead = localHead->next;
        if(localHead = tail->next) {
          return false; // queue is empty
        }
      }
    }
    // the below line is not recheable
    return INT_MIN;
  }
};


void simulator(int th_id, int max_ops, Queue &q) {
  int id = th_id;
  // start of thread
  clock_t start, end;
  // access CS k times
  for(int i = 0; i < max_ops; i++) {
    int val = rand() % (int)100;
    start = clock();
    cout<<rand()%3<<endl;
    if(true) { // runs with 2/3 probability
      // enqueue
      cout<<"enq\n";
      q.enqueue(val, th_id);
    } else {
      // dequeue
      cout<<"deq\n";
      int val = q.dequeue(th_id);
    }
    end = clock();
    entry_log[th_id].push_back(double(end - start) / double(CLOCKS_PER_SEC));
  }
}

void getInput(int* n, int* max_ops) {
  ifstream input;

  input.open("inp-params.txt");
  if(!input.is_open()) {
    cerr<<"Error opening input file"<<'\n';
    exit ( EXIT_FAILURE );
  }
  input >> *n >> *max_ops;
  input.close();

  return;
}

int main() {
  int n, max_ops; // number of threads
  getInput(&n, &max_ops);

  entry_log = vector<vector<double>> (n);

  // n threads
  thread *th = new thread[n];
  // Declare a queue object which is accessed from all the threads
  Queue q(10);

  // open output file
  out_file = fopen("Fill_in_queue.txt", "w");

  clock_t start, end;
  start = clock();
  // create n threads
  for(int i = 0; i < n; i++) {
    th[i] = thread(simulator, i, max_ops, ref(q));
  }
  // join the threads
  for (int i = 0; i < n; i++) {
    th[i].join();
  }

  end = clock();
  double total_time = double(end - start) / double(CLOCKS_PER_SEC);

  fclose(out_file);
  delete [] th;

  double sum_time = 0;
  for(int i = 0; i < n; i++) {
    for(int j = 0; j < entry_log[i].size(); j++) {
      sum_time += entry_log[i][j];
    }
  }

  cout<<"Average time taken for thread to complete enq/deq: "<<sum_time / n<<'\n';
  cout<<"Total time taken for simulation: "<< total_time <<'\n';
  cout<<c<<" "<<c1<<endl;
  return 0;
}
