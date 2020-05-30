Author        - Sai Harsha Kottapalli
Use           -  compute some statistics(namely, median, average and standard deviation) over a sequence of input numbers using multiple
                 threads, processes and compare the times taken by each of them
Instructions  -     When compiling MultiThreading program use -pthread
                    run the program specifying the input file name and the required output file in cmd line.(refer example if necessary)
                    File Instructions:
                        The first line consists of one integer denoting the size of input
                        The Next line consists of N input numbers seperated by ' ', for which the statistics is to be calculated.
                Example -
                  Input:
                    ./a.out < in.txt > out.txt
                  Output:
                    The average value is 953.8
                    The standard deviation value is 1434.37
                    The median value is 423

in.txt:
5
45 3445 423 854 2
