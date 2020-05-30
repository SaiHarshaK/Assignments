## Programming Assignment 2
Write a program to implement LRU, FIFO and OPTIMAL replacement policies in a cache. Assume that the cache has only one set. The binary should accept four arguments, as follows:
./binaryName LRU AddressSequenceFile.txt NumberOfCacheEntries
Your program should create output file such as RollNumber_LRU_AddressSequenceFile_ NumberOfCacheEntries.out.
For example, if we run
$./binaryName OPTIMAL InputFile.txt 8
and your roll number is CS13B1011, then, output file should be named CS13B1011_OPTIMAL_InputFile_8.out

The maximum number of addresses in input file will be 50,000. Maximum number of CacheEntries we will test for is 1024. So, if you are using fixed-size arrays, you can write the code accordingly.
The addresses may be strings and not necessarily numbers. The addresses may be separated by space or newline. We will not test your program with any incorrect input, except one: the AddressSequenceFile may have some empty lines or spaces anywhere in the file. Your program should be robust to this.
We will test your algorithm using our inputs files. Two sample AddressSequenceFile are attached to test your submission (AddressTrace_WithoutCacheBlocking.txt and AddressTrace_CacheBlocking.txt). In these files, each entry shows the address/location which are accessed.

Submission: The name of your submitted file MUST be Rollnumber_CacheEmulation.cpp, e.g., CS15BTECH99999_CacheEmulation.cpp.
You need to upload your code as a single C++ source file, which can be compiled and run with g++ without using any flags. For sake of avoiding compilation issues, do not use c++11 features. Use of STL (e.g., vector, find, etc.) is acceptable.
Output: Your program should print everything in output file. In such a file, the first four lines should be
TOTAL_ACCESSES = 1000
TOTAL_MISSES = 800
COMPULSORY_MISSES = 69
CAPACITY_MISSES = 731
Of course, your numbers may be different than 1000/800/69/731.
After these lines, print HIT or MISS on a new line, depending on whether the address hit or missed in the cache. Sample output files (corresponding to the input files) are also attached.
The TAs will test your code on different input files. Please adhere to the above mentioned guidelines to reduce TA effort. Since we may use automated scripts to check your solution, not following the guidelines will lead to incorrect match and reduction in the marks or zero marks. If your code cannot be compiled, we cannot award any marks to you. We are not concerned with the efficiency of your program but only its functionality. We will also use plagiarism detection tool on all the submissions.
