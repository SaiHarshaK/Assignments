from sklearn import preprocessing
from scipy.linalg import fractional_matrix_power
from sklearn.cluster import KMeans
import numpy as np
import pandas as pd
import heapq
import math
from sklearn.cluster import SpectralClustering

def gaussian_dist(X, Y):
  sum_val = 0.0
  for i in range(len(X)):
    sum_val += (X[i] - Y[i])**2
  return math.exp(-sum_val)

def getAdjacency(df):
  A = np.empty([len(df), len(df)])
  for i in range(len(df)):
    for j in range(len(df)):
      A[i][j] = gaussian_dist(df[i], df[j])
    A[i][i] = 0

  # top three max will have edges 1
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

# normalize data
df = preprocessing.normalize(df)

clustering = SpectralClustering(n_clusters=2, random_state=0).fit(df)
print(clustering.labels_)
print(sum(clustering.labels_))
