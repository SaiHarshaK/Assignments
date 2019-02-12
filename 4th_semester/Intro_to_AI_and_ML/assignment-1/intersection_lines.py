import numpy as np

def mid_pt(A, B):
  return (A + B) / 2

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

  D = mid_pt(B, C)
  F = mid_pt(A, B)

  AD = np.vstack((A, D)).T
  CF = np.vstack((C, F)).T

  print("The intersection of AD and CF: {0}".format(intersection(AD, CF)))
