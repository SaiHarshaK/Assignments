import numpy as np
import matplotlib.pyplot as plt

def dir_vec_eq(AB):
  return np.matmul(AB, np.array([-1, 1]))

def norm_vec_eq(AB):
  o_matrix = np.array([[0, 1], [-1, 0]])
  return np.matmul(o_matrix, dir_vec_eq(AB))

def intersection(AD, CF):
  n1 = norm_vec_eq(AD)
  n2 = norm_vec_eq(CF)
  N = np.vstack((n1, n2))
  p1 = np.matmul(n1, AD[:, 0])
  p2 = np.matmul(n2, CF[:, 0])
  P = np.vstack((p1, p2))
  n_inv_t = np.linalg.inv(N) # already in transpose. (verify by hand)
  return np.matmul(n_inv_t, P)

if __name__ == "__main__":
  A = np.array([-2, -2])
  B = np.array([1, 3])
  C = np.array([4, -1])

  AB = np.vstack((A, B)).T

  n = norm_vec_eq(AB)
  a = np.linalg.norm(B - C)
  b = np.linalg.norm(C - A)
  c = np.linalg.norm(A - B)

  I = (a * A + b * B + c * C) / (a + b + c)
  rhs = np.matmul(n, I - A) / np.linalg.norm(n)

  IX_eq = np.vstack((I, I + n)).T
  X = intersection(AB, IX_eq)

  lhs = np.linalg.norm(I - X)

  print("LHS: {0} and RHS: {1}".format(lhs, rhs))
