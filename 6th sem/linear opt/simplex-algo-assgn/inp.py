import numpy as np
m = int(input("Enter the value of m:")) 
n = int(input("Enter the value of n:")) 

A = [] 
print("Enter the values of A rowwise:") 

for i in range(m):
	x = input()
	a = x.split()
	for j in range(n): 
		a[j] = float(a[j])
	A.append(a)

A = np.array(A)

print("Enter the values of B")
y = input()
B = y.split()
print(B)
for j in range(m):
	B[j] = float(B[j])
B = np.array(B)
print(B)
print("Enter the values of C")
y = input()
C = y.split()
for j in range(n):
	C[j] = float(C[j])
C = np.array(C)

for i in range(n):
	temp = np.zeros(n)
	temp[i] = -1
	if np.where(np.all(A==temp, axis=1))[0].size == 0:
		A = np.append(A, np.array([temp]), 0)
		B = np.append(B, 0)
print(A)
# print(B)
# print(C)