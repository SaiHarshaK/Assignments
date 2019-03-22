1) Create a file "inp-params.txt".
    Format to be followed is :
    capacity (Capacity of buffer)
    n_p (Number of Producers)
    n_c (Number of Consumers)
    rep_p (Number of times each producer should produce)
    rep_c (Number of times each consumer should consume)
    average of exponential distribution 1
    average of exponential distribution 2

    Example:
    100
    10
    15
    15
    10
    8
    12



2)
    a) Compile the prod_cons_locks file by executing following command:
    g++ prod_cons-locks-cs17btech11036.cpp -o locks -lpthread

    b) Compile the prod_cons_locks file by executing following commands:
    g++ prod_cons-sems-cs17btech11036.cpp -o sems -lpthread


3)
    a) Run the TAS file by executing :
    ./locks

    b) Run the CAS file by executing :
    ./sems

4) Check Sem-Prod_Cons-Log.txt or Lock-Prod_Cons-Log.txt file for logs.

5) Logs have the details of timings for the production and consumption, followed by Average waiting time of producers and consumers at the end.
