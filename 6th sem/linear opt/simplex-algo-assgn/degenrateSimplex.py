import numpy as np
import time
import sys

# Wrapper function to run the simplex algorithm
# again and again till optimal solution is found
def degenerateSimplex(A, B, C, initialFeasiblePoint = None):
	y = np.zeros(B.shape[0])
	div = 10
	while True:
		x = degenerateSimplexHelper(A, B+y, C, initialFeasiblePoint)
		if x["isDegenerate"]:
			y = np.append(np.zeros(C.shape[0]), np.random.uniform(0,1,B.shape[0] - C.shape[0]))/n
			continue
		tr = x["tightRows"]
		potentialPoint = np.linalg.inv(A[tr]).dot(B[tr])
		# print("potentialPoint", potentialPoint)
		Bc = A.dot(potentialPoint)
		if np.all(Bc <= B):
			return potentialPoint
		else:
			y = np.append(np.zeros(C.shape[0]), np.random.uniform(0,1,B.shape[0] - C.shape[0]))/n
		n = n*10

def getInput():
	# get the dimension of A
	m = int(input()) 
	n = int(input()) 

	# read in the matrix A
	A = []
	for i in range(m):
		x = input()
		a = x.split()
		for j in range(n): 
			a[j] = float(a[j])
		A.append(a)

	A = np.array(A)

	# read in the vector B
	y = input()
	B = y.split()
	# print(B)
	for j in range(m):
		B[j] = float(B[j])
	B = np.array(B)

	# read in the vector C
	y = input()
	C = y.split()
	for j in range(n):
		C[j] = float(C[j])
	C = np.array(C)

	# add xi >= 0 constraints if not present
	for i in range(n):
		temp = np.zeros(n)
		temp[i] = -1
		if np.where(np.all(A==temp, axis=1))[0].size == 0:
			A = np.append(A, np.array([temp]), 0)
			B = np.append(B, 0)

	return A, B, C

def getInitialFeasiblePoint(A, B, C):
	allNonNegative = True
	for i in B:
		if i < 0:
			allNonNegative = False;
			break
	if allNonNegative:
		return np.zeros(C.shape[0])

	# alternate methdod, find intersection of n planes and check if it is
	# a vertex, if so use it as the initial point
	
	m = A.shape[0]
	n = A.shape[1]
	# print("Looking for feasible point")
	for i in range(100*m*m):
		# get random n rows
		randomRows = np.random.choice(m, n)
		Am = A[randomRows]
		Bm = B[randomRows]
		if np.linalg.matrix_rank(Am) != Am.shape[0]:
			continue
		possiblePoint = np.linalg.inv(Am).dot(Bm)
		# print("Candidate point", possiblePoint)
		tightRows = []
		satisfies = True
		for i in range(A.shape[0]):
			if abs(A[i].dot(possiblePoint) - B[i]) < 0.000000001:
				tightRows.append(i)
				continue
			if A[i].dot(possiblePoint) > B[i]:
				satisfies = False
				break
		if len(tightRows) < n:
			satisfies = False
		if satisfies:
			return possiblePoint
	sys.exit("The given problem may be infeasible, if not, try again")

# for degenerate questions we use this call to jump from one vertex to another
def degenerateSimplexHelper(A, B, C, initialFeasiblePoint = None):
	# print(A)
	# print(B)
	# print(C)

	# get the initial feasible point
	if initialFeasiblePoint is None:
		currentPoint = getInitialFeasiblePoint(A, B, C)
	else:
		currentPoint = initialFeasiblePoint
	# print("currentPoint", currentPoint)

	# this is an upper bound I have set on the number of times
	# simplex can be run, this is a failsafe to detect unbounded
	# problems	
	for k in range(1000*A.shape[0]*A.shape[0]):
		# get the rows in A for which the current point satisfies
		# with equality
		tightRows = []
		for i in range(A.shape[0]):
			# if len(tightRows) > C.shape[0]:
			# 	None
			if abs(A[i].dot(currentPoint) - B[i]) < 0.0000001:
				tightRows.append(i)
			if len(tightRows) > C.shape[0]:
				return {"isDegenerate":True}

		# print(tightRows)
		Ap = A[tightRows]
		# print("Ap", Ap)

		# for the n independent tight rows, find a alphas
		# such that their linear combination is equal to C
		alphas = C.dot(np.linalg.inv(Ap))
		# print("alphas", alphas)
		# check if there are any negative elements in alpha
		allPositive = True
		negativeIndex = None
		for i in range(alphas.shape[0]):
			if alphas[i] < 0:
				negativeIndex = i
				allPositive = False
				break
		# if all alphas are positive then the current point itself is the
		# opimal point
		if allPositive:
			# print("All positive")
			return {"isDegenerate": False, "tightRows":tightRows}
		# the direction vector would be ith coloumn of the negative
		# of the inverse of the tight row matrix, where i is the index
		# of the alpha element which is < 0
		directionVector = -np.linalg.inv(Ap)[:, negativeIndex]
		# print("directionVector", directionVector)

		# using the direction vector move in it's direction and find
		# the next vertex

		minT = None
		for i in range(A.shape[0]):
			if i in tightRows:
				continue
			if (A[i].dot(directionVector)) <= 0:
				continue
			curT = (B[i] - A[i].dot(currentPoint))/(A[i].dot(directionVector))
			# print(curT)
			if minT is None or curT < minT:
				minT = curT
		if minT is None:
			sys.exit("The given problem may be unbounded")
		currentPoint = currentPoint + directionVector*minT
		# print(minT)
		# print(currentPoint)
		# return np.random.random(C.shape[0])
		# iteratively find bette solutions
	sys.exit("The given problem may be unbounded")


A, B, C = getInput()
solution = degenerateSimplex(A, B, C)
print("The given Linear Program is maximised at: " + str(solution))