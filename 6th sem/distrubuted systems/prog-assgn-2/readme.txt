1) Create a file "inp-params.txt". Here, input given will be parsed by the program
    Format to be followed is :

    N - Total number of processes or cells.
    Wr - average of exponential wait time before introduction of red cells into the system.
    Ir - number of red cells introduced into the system.
    Wb - average of exponential wait time before introduction of blue cells into the system after the introduction of red cells.
    Ib - number of red cells introduced into the system.
    λblue - exponential delay between successive blue messages that a blue cell sends to its neighbours upon
    activation.
    λred - exponential delay between successive blue messages that a blue cell sends to its neighbours upon
    activation.
    λsnd - parameter used to simulate exponential delay in message send.
    p - percentage of neighbors a red cell can affect
    q - percentage of neighbors a blue cell can affect

    Example:
    4 1 1 1 2 1 1 1 1 1
    1 2 3
    2 1 3 4
    3 1 2
    4 2
    1 2
    2 3 4


2)
    Compile the program file by executing following command:
    a)g++ Virus1-CS17BTECH11036.cpp -pthread -std=c++17 -g -o virus1
    b)g++ Virus2-CS17BTECH11036.cpp -pthread -std=c++17 -g -o virus2

3)
    Run the executable file by executing :
    a)./virus1
    b)./virus2

4) Check out-log.txt file for logs of simulation of the rrespective termination detection implementation.
