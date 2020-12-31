# Distributed-Efficient-Leader-Election
Distributed Efficient Leader Election

## How to run?

```sh
g++ Leader-Election.cpp -lpthread
./a.out input.txt
./a.out circle_testcase
./a.out linear_testcase
./a.out gen_testcase
```

### Sample input.txt
```
number_of_nodes
pid1 dis11 dis12 dis13 ...
pid2 dis21 dis22 dis23 ...
...
```
where `disij` means distance between processes with pid i and pid j

```
4
10 0 2 7 -1
20 2 0 1 -1
30 7 1 0 1
40 -1 -1 1 0
```
### Sample output

```
BULLY: Node 40 sets 20 as the leader
BULLY: Node 20 sets 20 as the leader
BULLY: Node 10 sets 20 as the leader
BULLY: Node 30 sets 20 as the leader
...
```
