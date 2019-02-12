import numpy as np
import matplotlib.pyplot as plt

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
  E = mid_pt(C, A)
  F = mid_pt(A, B)

  AD = np.vstack((A, D)).T
  CF = np.vstack((C, F)).T
  BE = np.vstack((B, E)).T

  print("The intersection of - ")
  print(" AD and CF: {0}".format(intersection(AD, CF)))
  print(" BE and CF: {0}".format(intersection(BE, CF)))
  print(" AD and BE: {0}".format(intersection(AD, BE)))
  print("(A + B + C) / 3: {0}".format((A + B + C) / 3))

  #graph

  x = [A[0], B[0]]
  y = [A[1], B[1]]
  plt.plot(x, y, label='$AB$')
  x = [B[0], C[0]]
  y = [B[1], C[1]]
  plt.plot(x, y, label='$BC$')
  x = [C[0], A[0]]
  y = [C[1], A[1]]
  plt.plot(x, y, label='$CA$')

  x = [A[0], D[0]]
  y = [A[1], D[1]]
  plt.plot(x, y, label='$AD$')
  x = [B[0], E[0]]
  y = [B[1], E[1]]
  plt.plot(x, y, label='$BE$')
  x = [C[0], F[0]]
  y = [C[1], F[1]]
  plt.plot(x, y, label='$CF$')

  plt.plot(A[0], A[1], 'o')
  plt.text(A[0] * (1 + 0.1), A[1] * (1 - 0.1), 'A')
  plt.plot(B[0], B[1], 'o')
  plt.text(B[0] * (1 - 0.2), B[1] * (1), 'B')
  plt.plot(C[0], C[1], 'o')
  plt.text(C[0] * (1 + 0.03), C[1] * (1 - 0.1), 'C')

  plt.plot(D[0], D[1], 'o')
  plt.text(D[0] * (1 + 0.1), D[1] * (1 - 0.1), 'D')
  plt.plot(E[0], E[1], 'o')
  plt.text(E[0] * (1 - 0.2), E[1] * (1 - 0.1), 'E')
  plt.plot(F[0], F[1], 'o')
  plt.text(F[0] * (1 + 0.5), F[1] * (1 - 0.1), 'F')

  plt.plot((A[0] + B[0] + C[0]) / 3, (A[1] + B[1] + C[1]) / 3, 'o')
  plt.text((A[0] + B[0] + C[0]) / 3, ((A[1] + B[1] + C[1]) / 3) + 0.1, 'G')

  plt.xlabel('$x$')
  plt.ylabel('$y$')
  plt.legend(loc='best')
  plt.grid()
  plt.savefig('centroid.pdf')
  plt.savefig('centroid.eps')
  plt.show()
