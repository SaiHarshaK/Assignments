1) Create a file "inp-params.txt".
    Format to be followed is :
        Number of threads - n
        Number of rep - k
        Number of classes - s
        average of exponential distribution 1
        average of exponential distribution 2

    Example:
    16 100 5 5 20


2)
    a) Compile the file by executing following command:
    g++ bankers-cs17btech11036.cpp -lpthread -o bankers

3)
    a) Run the dining_philosophers file by executing :
    ./bankers

4) Check output.txt file for logs of events by the simulation of the programs.

5) Check stdout for details regarding average_waiting_time by the program.
