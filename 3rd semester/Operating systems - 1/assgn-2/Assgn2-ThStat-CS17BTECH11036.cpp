#include <pthread.h>
#include <iostream>
#include <cmath>
#include <algorithm>
#include <fstream>

using namespace std;

/* these data is shared by the thread(s) */
long double average, standard_dev, median;
long long int N;

void *find_average(void *param) { /* thread call this function */
  average = 0.0;
  long double *arr = (long double *)param;
  for(long long int i = 0; i < N; i++) {
    average += arr[i];
  }
  average /= (double)N;
  pthread_exit(0);
}

void *find_standard_dev(void *param) { /* thread call this function */
  long double *arr = (long double *)param;
  long double temp, sd = 0.0;
  for(long long int i = 0; i < N; i++) {
    temp = arr[i] - average;
    temp = temp * temp;
    sd += temp;
  }

  sd /= (double)(N-1);
  standard_dev = sqrt(sd);

  pthread_exit(0);
}

void *find_median(void *param) { /* thread call this function */
  long double *arr = (long double *)param;
  sort(arr, arr + N);

  if( N % 2 == 0 ) { //even
    median = arr[N/2];
  } else {
    median = (arr[N/2] + arr[(N-1)/2]) / 2;
  }

  pthread_exit(0);
}

int main(int argc, char *argv[]) {
  pthread_t tid[3]; /* the thread identifier */
  pthread_attr_t attr[3]; /* set of thread attributes */

  /* set the default attributes of the thread */
  for( int i = 0; i < 3; i++ )
    pthread_attr_init(&attr[i]);

  /* get input */
  cin>>N;
  long double *num;
  num = (long double*)malloc(sizeof(long double) * N);
  for (long long int i = 0; i < N; i++) {
    cin>>num[i];
  }

  std::cout << std::fixed;

  /* create the threads */
  pthread_create(&tid[0], &attr[0], find_average, (void *)num);
  pthread_create(&tid[2], &attr[2], find_median, (void *)num);

  pthread_join(tid[0],NULL);/* wait for the thread to exit */
  pthread_create(&tid[1], &attr[1], find_standard_dev, (void *)num);/* create the thread, after average is calculated */

  pthread_join(tid[2],NULL);/* wait for the thread to exit */
  pthread_join(tid[1],NULL);/* wait for the thread to exit */

  cout<<"The average value is "<<average<<'\n';
  cout<<"The standard deviation value is "<<standard_dev<<'\n';
  cout<<"The median value is "<<median<<'\n';

  return 0;
}
