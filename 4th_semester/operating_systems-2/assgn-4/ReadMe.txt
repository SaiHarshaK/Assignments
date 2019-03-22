1) Create a file "inp-params.txt".
    Format to be followed is :
        Number of writers - nw
        Number of readers - nr
        Number of times each writer should write - kw
        Number of times each reader should read - kr
        average of exponential distribution 1
        average of exponential distribution 2

    Example:
        20 10 10 10 500 800


2)
    a) Compile the rw file by executing following command:
    g++ rw-cs17btech11036.cpp -o rw -lpthread

    b) Compile the frw file by executing following commands:
    g++ frw-cs17btech11036.cpp -o fair_rw -lpthread


3)
    a) Run the TAS file by executing :
    ./rw

    b) Run the CAS file by executing :
    ./fair_rw

4) Check RW-Log.txt or FairRW-Log.txt file for logs of events by the simulation of the programs.

5) Check Average_time.txt for details regarding average_waiting_time and worst_waiting_time for reader/writer by the program.
