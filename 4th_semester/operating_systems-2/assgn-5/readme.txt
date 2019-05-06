1) Create a file "inp-params.txt".
    Format to be followed is :
        Number of philosophers - n
        Number of times each philosopher thread tries to enter the CS - h
        average of exponential distribution 1
        average of exponential distribution 2

    Example:
        5 10 1 2


2)
    a) Compile the dining_philosophers file by executing following command:
    g++ dphil-cs17btech11036.cpp -lpthread -o dphil

3)
    a) Run the dining_philosophers file by executing :
    ./dphil

4) Check dphil-log.txt file for logs of events by the simulation of the programs.

5) Check Times.txt for details regarding average_waiting_time and worst_waiting_time for philosopher by the program.
