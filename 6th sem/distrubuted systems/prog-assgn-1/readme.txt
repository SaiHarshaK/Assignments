1) Create a file "inp-params.txt". Here, input given will be parsed by the program
    Format to be followed is :

    N - no. of processes or time servers.
    K - no of iterations/rounds of modification of error factor between any 2 clocks.
    λp - parameter for exponential wait between 2 successive synchronization request.
    λq - parameter for exponential wait between 2 successive synchronization reply.
    λsnd - parameter used to simulate exponential delay in message send.
    λdrif t - parameter for exponential drift of local clock time. λwkDrif t - parameter to give some time lag
    between clock drifts.

    Example:
    5 2 3 3 2 3


2)
    a) Compile the program file by executing following command:
    g++ CS-CS17BTECH11036.cpp -o cs -pthread


3)
    a) Run the executable file by executing :
    ./cs

4) Check out-log.txt file for logs of simulation of clock synchronization program and tabular timestamps.
