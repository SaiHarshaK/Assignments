1) Create a file "inp-params.txt". Here, input given will be parsed by the program
    Format to be followed is :

    n - number of writer threads
    m - number of registers
    mew_w, mew_r - avg of exponential distributions for writer and snapshotter respectively (IN SECONDS)
    k - number of times, snapshotter takes snapshot

    Example:
    10 20 1 10 5.


2)
    a) Compile the program file by executing following command:
    g++ mrsw-CS17BTECH11036.cpp -lpthread -o program_mrsw
    g++ mrmw-CS17BTECH11036.cpp -lpthread -o program_mrmw


3)
    a) Run the executable file by executing :
    ./program_mrsw
    ./program_mrmw

4) Check “MRSW-Snap.txt” and “MRMW-Snap.txt” for the logs generated by the respective Programs in the simulation.
    Check stdout for average time taken and worst case time taken by snapshotter to take snapshot.
