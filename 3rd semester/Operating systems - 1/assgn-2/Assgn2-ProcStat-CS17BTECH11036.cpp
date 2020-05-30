#include <iostream>
#include <cmath>
#include <algorithm>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/mman.h>
#include <unistd.h>

using namespace std;

long double find_average(long double *arr, long long int N) { /* thread call this function */
  long double average = 0.0;
  for(long long int i = 0; i < N; i++) {
    average += arr[i];
  }
  average /= (double)N;

  return average;
}

long double find_standard_dev(long double *arr, long long int N, long double average) { /* thread call this function */
  long double temp, sd = 0.0;
  for(long long int i = 0; i < N; i++) {
    temp = arr[i] - average;
    temp = temp * temp;
    sd += temp;
  }

  sd /= (double)(N-1);

  return sqrt(sd);
}

long double find_median(long double *arr, long long int N) { /* thread call this function */
  sort(arr, arr + N);
  long double median;

  if( N % 2 == 0 ) { //even
    median = arr[N/2];
  } else {
    median = (arr[N/2] + arr[(N-1)/2]) / 2;
  }

  return median;
}

int main(int argc, char *argv[]) {
  long double *average, *standard_dev, *median;
  average = (long double *)mmap(NULL, sizeof(average), PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
  standard_dev =  (long double *)mmap(NULL, sizeof(standard_dev), PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
  median =  (long double *)mmap(NULL, sizeof(median), PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);

  /* get input */
  long long int N;
  cin>>N;
  long double *num;
  num = (long double*)malloc(sizeof(long double) * N);
  for(long long int i = 0; i < N; ++i) {
    cin>>num[i];
  }

  std::cout << std::fixed;

  pid_t pid[2]; // with combination of two forks we can get three worker processes
  pid[0] = fork(); //to fork a child

  if( pid[0] == 0) {//process 1
    pid[1] = fork();

    if( pid[1] == 0 ) {//process 2
      *average = find_average(num, N);
    } else {
      wait(NULL);
      *standard_dev = find_standard_dev(num, N, *average);
    }
  } else { //parent - process 3
    *median = find_median(num, N);
    wait(NULL);//parent waits till all child process are done executing
    cout<<"The average value is "<<*average<<'\n';
    cout<<"The standard deviation value is "<<*standard_dev<<'\n';
    cout<<"The median value is "<<*median<<'\n';
  }

  munmap(average, sizeof(average));
  munmap(standard_dev, sizeof(standard_dev));
  munmap(median, sizeof(median));

  return 0;
}
