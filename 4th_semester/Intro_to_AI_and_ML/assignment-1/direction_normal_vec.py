import numpy as np

def dir_vec_pt(A, B):
  return B - A

def dir_vec_eq(AB):
  return np.matmul(AB, np.array([-1, 1]))

def norm_vec_pt(A, B):
  o_matrix = np.array([[0, 1], [-1, 0]])
  return np.matmul(o_matrix, B - A)

def norm_vec_eq(AB):
  o_matrix = np.array([[0, 1], [-1, 0]])
  return np.matmul(o_matrix, dir_vec_eq(AB))


if __name__ == "__main__":
  A = np.array([-2, -2])
  B = np.array([1, 3])
  AB = np.vstack((A, B)).T
  print (dir_vec_eq(AB))
  print (norm_vec_eq(AB))
