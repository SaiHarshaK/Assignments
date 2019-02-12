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
  AB_n = norm_vec_eq(AB)
  BC = np.vstack((B, C)).T
  BC_n = norm_vec_eq(BC)
  CA = np.vstack((C, A)).T
  CA_n = norm_vec_eq(CA)

  a = np.linalg.norm(B - C)
  b = np.linalg.norm(C - A)
  c = np.linalg.norm(A - B)

  I = (a * A + b * B + c * C) / (a + b + c)

  IX_eq = np.vstack((I, I + AB_n)).T
  X = intersection(AB, IX_eq)
  IY_eq = np.vstack((I, I + BC_n)).T
  Y = intersection(BC, IY_eq)
  IZ_eq = np.vstack((I, I + CA_n)).T
  Z = intersection(CA, IZ_eq)

  print("length of IX: {0}".format(np.linalg.norm(I - X)))
  print("length of IY: {0}".format(np.linalg.norm(I - Y)))
  print("length of IZ: {0}".format(np.linalg.norm(I - Z)))
  print("Hence this common point: {0}, is the inradius".format(np.linalg.norm(I - Z)))
