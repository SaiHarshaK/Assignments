#include <iostream>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/mman.h>
#include <unistd.h>
#include <iomanip>
#include <string.h>
typedef long long int lli;

using namespace std;

int main(int argc, char **argv)
{
    if( argc < 2 ) {
        printf("Please specify what command to run");
    }
    struct timeval *start, *end;
    start = (struct timeval*)mmap(NULL, sizeof(timeval), PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
    end =  (struct timeval*)mmap(NULL, sizeof(timeval), PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
    pid_t pid;
    pid = fork(); //to fork a child

    if( pid < 0 ) { //error case
        printf("Error, exiting...");
        exit(EXIT_FAILURE);
    } else if( pid == 0 ) { //child process
        char* cmd[argc];
        for (int i = 0; i < argc; i++) {
            cmd[i] = argv[i+1];
        }
        cmd[argc-1]=NULL;
        gettimeofday(start, NULL);
        execvp(cmd[0], cmd);
    } else { //parent process
        wait(NULL);
        gettimeofday(end, NULL);
        double time_taken = (*end).tv_sec - (*start).tv_sec;
        time_taken += (double((*end).tv_usec) - double((*start).tv_usec)) / 1000000;
        std::cout << std::fixed;
        cout<<"Elapsed time: ";
        cout<<setprecision(10)<<time_taken;
        cout<<" seconds";
    }
    munmap(start, sizeof(start));
    munmap(end, sizeof(end));
    return 0;
}
