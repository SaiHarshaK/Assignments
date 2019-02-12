/*
author: Sai Harsha Kottapalli
About: assignment for operating systems 2. Check ReadMe for instructions. 
 */
#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>

using namespace std;

/* a unit of time in this program is 10 micro-seconds */

class Process {
  public:
    int pid, period, proc_time, time_rem, repeats; // pid -> process identifier, proc_time -> processing time, deadline -> deadline given to the process
    int start, deadline;
    bool in_ready;
    //here we have assumed, deadline is equal to period.(as given in problem statement)
    void assign_attr(int pid, int proc_time, int period, int start, int repeats) {
      this->pid = pid;
      this->proc_time = 100 * proc_time;
      this->time_rem = 100 * proc_time;
      this->period = 100 * period;
      this->start = 100 * start;
      this->deadline = 100 * (start + period);
      this->repeats = repeats;
      this->in_ready = true;

      return;
    }
};

void getInput(int* nProc, vector<Process> &procs) {
  ifstream input;

  input.open("inp-params.txt");

  input>>*nProc;
  int n = *nProc;
  while(n--) {
    int p, t, per, rep;
    input>>p>>t>>per>>rep;
    Process newProc;
    newProc.assign_attr(p, t, per, 0, rep);
    procs.push_back(newProc);
  }
  input.close();

  return;
}

bool compare(Process a, Process b) {
  return (a.period < b.period ); // ascending order w.r.t. period
}

int main() {
  // add context switch time?
  int cs;
  cout<<"add context switch time? Press 1 for yes. 0 for no."<<endl;
  cin>>cs;
  
  // process input
  int nProc; // number of processes
  vector<Process> procs;  
  getInput(&nProc, procs);

  // output files
  ofstream log, stats;

  // print process details at start
  log.open("RMS-Log.txt");
  for (int i = 0; i < nProc; i++) {
    log<<"Process P"<<procs[i].pid<<": processing time="<<procs[i].proc_time / 100<<"; deadline:"<<procs[i].deadline / 100<<"; period:"<<procs[i].period / 100<<" joined the system at time 0"<<endl;
  }


  // stats vars
  int total_processes = 0;
  int completed_processes = 0;
  int total_wait_time = 0;

  vector<Process> ready; // queue for ready states
  int last_process; // -1 implies last process was completed
  for (int i = 0; i < nProc; i++) {
    ready.push_back(procs[i]);
    total_processes++;
  }
  sort(ready.begin(), ready.end(), compare);
  last_process = ready[0].pid;

  int current_time = 0, idle_break;
  bool idle = false;

  while(1) {
    //check if any processes are left to execute
    bool procDone = true;
    for (int i = 0; i < nProc; i++) {
      if(procs[i].repeats > 0) {
        procDone = false;
        break;
      }
    }
    if(procDone) break;

    //if deadline crossed, remove it from queue
    // if the running process deadline is met
    if(ready[0].deadline <= current_time) {
      last_process = -1;
    }
    for (int i = 0; i < ready.size(); i++) {
      if(ready[i].deadline <= current_time) {
        //remove ready queue indicator and total wait time
        for (int j = 0; j < nProc; j++) {
          if(procs[j].pid == ready[i].pid) {
            procs[j].in_ready = false;
            procs[j].start += procs[j].period;
            procs[j].deadline += procs[j].period;
            procs[j].repeats--;
            total_wait_time += ready[i].period - (ready[i].proc_time - ready[i].time_rem);
            if(procs[j].repeats == 0) { // remove from process list
              procs.erase(procs.begin() + j);
              nProc--;
            }
            break;
          }
        }
        log<<"Process P"<<ready[i].pid<<" crossed its deadline - "<<(double)ready[i].deadline / 100<<". It will be removed."<<endl;
        ready.erase(ready.begin() + i);
        i--;
      }
    }

    //check if any new process can be added to ready queue
    for (int i = 0; i < nProc; i++) {
      if(!procs[i].in_ready && procs[i].start <= current_time) {
        procs[i].in_ready = true;
        ready.push_back(procs[i]);
        total_processes++;
      }
    }
    sort(ready.begin(), ready.end(), compare);

    if(!ready.empty()) {
      if(idle) {
        log<<"CPU is idle till time "<<(double)current_time / 100<<"."<<endl;
        idle = false;
      }
      if(last_process != -1 && ready[0].pid != last_process) { // is current process interrupted?
        //mark last process interrupted
        int time_rem;
        for (int i = 0; i < nProc; i++) {
          if(ready[i].pid == last_process) {
            time_rem = ready[i].time_rem;
            break;
          }
        }
        log<<"Process P"<<last_process<<" is preempted by Process P"<<ready[0].pid<<" at time "<<(double)current_time / 100<<". Remaining processing time:"<<(double)time_rem / 100<<endl;
        // context switch occurs. increase time by 1 unit
        if(cs == 1) current_time++;
      }

      // start process
      if(ready[0].time_rem == ready[0].proc_time) {
        log<<"Process P"<<ready[0].pid<<" starts execution at time "<<(double)current_time / 100<<"."<<endl;
        last_process = ready[0].pid;
      } else if(ready[0].pid != last_process) { // process is resuming
        log<<"Process P"<<ready[0].pid<<" resumes execution at time "<<(double)current_time / 100<<"."<<endl;
        last_process = ready[0].pid;
      }

      ready[0].time_rem--;
      if(ready[0].time_rem == 0) { // remove from queue when completed executing
        log<<"Process P"<<ready[0].pid<<" finishes execution at time "<<(double)(current_time + 1) / 100<<"."<<endl;
        last_process = -1;
        completed_processes++;
        total_wait_time += (current_time - ready[0].start) - ready[0].proc_time;
        for (int i = 0; i < nProc; i++) {
          if(procs[i].pid == ready[0].pid) {
            procs[i].repeats--;
            if(procs[i].repeats == 0) { // remove from process list
              procs.erase(procs.begin() + i);
              nProc--;
            } else if(current_time % procs[i].period != 0) { // doesnt repeat exactly at its removal time
              procs[i].in_ready = false;
              procs[i].start += procs[i].period;
              procs[i].deadline += procs[i].period;
            } else { // arrives at its removal time
              procs[i].start += procs[i].period;
              procs[i].deadline += procs[i].period;
              ready.push_back(procs[i]);
              total_processes++;
            }
            ready.erase(ready.begin());
            break;
          }
        }
      }

      current_time++;
    } else { // check if cpu is idle
      //check if any new process can be added to ready queue
      for (int i = 0; i < nProc; i++) {
        if(!procs[i].in_ready && procs[i].start <= current_time) {
          procs[i].in_ready = true;
          ready.push_back(procs[i]);
          total_processes++;
        }
        sort(ready.begin(), ready.end(), compare);
      }
      idle = true;
      current_time++;
    }

  }

  log.close();

  //stats file
  stats.open("RM-Stats.txt");
  stats<<"Number of processes that came into the system      : "<<total_processes<<endl;
  stats<<"Number of processes that successfully completed    : "<<completed_processes<<endl;
  stats<<"Number of processes that missed their deadlines    : "<<total_processes - completed_processes<<endl;
  stats<<"Average waiting time for each process              : "<<(double)total_wait_time / (total_processes * 100)<<endl;
  stats.close();

  return 0;
}
