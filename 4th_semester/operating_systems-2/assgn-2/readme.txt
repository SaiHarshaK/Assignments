1) Create a file "inp-params.txt".
    Format to be followed is :
    n (number of processes)
    k (Access frequency)
    average of exponential distribution 1
    average of exponential distribution 2

    Example:
    10
    1000
    10
    20


2)
    a) Compile the TAS file by executing following command:
    g++ SrcAssgn2-tas-CS17btech11036.cpp -o TAS -lpthread

    b) Compile the CAS file by executing following commands:
    g++ SrcAssgn2-cas-CS17btech11036.cpp -o CAS -lpthread

    c) Compile the CAS-Bounded file by executing following commands:
    g++ SrcAssgn2-cas-bounded-CS17btech11036.cpp -o CAS-bounded -lpthread


3)
    a) Run the TAS file by executing :
    ./TAS

    b) Run the CAS file by executing :
    ./CAS

    c) Run the CAS-Bounded file by executing :
    ./CAS-Bounded

4) Check TAS-Log.txt or CAS-Log.txt or CAS-Bounded-Log.txt file for logs.

5) Logs have the details of requested, entry and exit timings, followed by Average waiting time and worst case waiting time at the end.
