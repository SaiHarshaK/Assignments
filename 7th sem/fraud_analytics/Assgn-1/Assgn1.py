"""
CS6890 - Assignment 1 - Identifying fraudulent Taxpayers using Spectral Clustering

Authors:
    Sai Harsha K -- CS17BTECH11036
    Tanmay R     -- CS17BTECH11042
"""
from scipy.linalg import fractional_matrix_power
import numpy as np
import pandas as pd
import heapq
import math

def gaussian_dist(X, Y):
  """Applies guassian kernel on two given points and returns the value

  Attributes:
      X -- DataPoint X
      Y -- DataPoint Y

  Outputs:
      Scalar value obtained after applying guassian kernel
  """
  sum_val = 0.0
  for i in range(len(X)):
    sum_val += (X[i] - Y[i])**2
  return math.exp(-sum_val)

def getAdjacency(df):
  """Calculates the adjacency matrix for the given set of point from a similarity
  matrix which encodes local neighbourhood information of the 3 most nearest neighbours

  Attributes:
      df -- List of points with n dimensions

  Outputs:
    Adjacency matrix representing an undirected graph between the given data points
  """
  A = np.empty([len(df), len(df)])
  for i in range(len(df)):
    for j in range(len(df)):
      A[i][j] = gaussian_dist(df[i], df[j])
    A[i][i] = 0

  # top three closest neighbours will have edges 1(connected)
  index = list(range(0, len(df)))
  Adj = np.zeros((len(df), len(df)))
  for i in range(len(df)):
    max_index = heapq.nlargest(3, zip(A[i], index))
    for z in range(3):
      Adj[i][max_index[z][1]] = 1
      Adj[max_index[z][1]][i] = 1

  return Adj

# read data
df = pd.read_csv("assgn-dataset.csv")
df = df.replace(np.nan,0)
df = df.values.tolist()

# get the adjacency matrix using guassian similarity
A = getAdjacency(df)

# create the graph laplacian
D = np.diag(A.sum(axis=1))

# normalized laplacian matrix
L = np.matmul(np.matmul(fractional_matrix_power(D, -0.5), (D - A)), fractional_matrix_power(D, -0.5))

# find the eigenvalues and eigenvectors
vals, vecs = np.linalg.eig(L)

# sort
vecs = vecs[:,np.argsort(vals)]
vals = vals[np.argsort(vals)]

# use Fiedler value to find best cut to separate data
clusters = vecs[:,1] > 0

maxim = 0
num_clusters = 2
vals = vals[::-1]
for i in range(1, 1163):
  if(vals[i] - vals[i-1] > maxim):
    maxim = vals[i] - vals[i-1]
    num_clusters = i + 1

print("Result of Spectral Clustering: ")
print("Number of clusters obtained via EigenGap method: ", num_clusters)
print("Number of clusters obtained via taking number of zero eigen values: ", sum(i < 1e-10 for i in vals))
print("Size of 1st cluster: ", sum(clusters))
print("Size of 2nd cluster: ", 1163 - sum(clusters) + 1)

indexes = list(range(1, len(df) + 1))
vals_eigen_split = vecs[:,1]

# import matplotlib.pyplot as plt
# import matplotlib as mpl
# plt.scatter(indexes, vals_eigen_split, c ="blue")
# plt.show()
