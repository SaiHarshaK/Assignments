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
  BC = np.vstack((B, C)).T
  CA = np.vstack((C, A)).T

  AP_v = norm_vec_eq(BC)
  BQ_v = norm_vec_eq(CA)
  CR_v = norm_vec_eq(AB)

  AP = np.vstack((A, A + AP_v)).T
  BQ = np.vstack((B, B + BQ_v)).T
  CR = np.vstack((C, C + CR_v)).T

  print("The altitude vectors - ")
  print("AP: {0}".format(AP_v))
  print("BQ: {0}".format(BQ_v))
  print("CR: {0}".format(CR_v))

  # intersection of AP and BQ
  O = intersection(AP, BQ)
  print("Intersection of AP and BQ: {0}".format(O))

  # P, Q, R calculation
  P = intersection(AP, BC)
  Q = intersection(BQ, CA)
  R = intersection(CR, AB)
  print("P: {0}".format(P))
  print("Q: {0}".format(Q))
  print("R: {0}".format(R))

  # graph

  x = [A[0], B[0]]
  y = [A[1], B[1]]
  plt.plot(x, y, label='$AB$')
  x = [B[0], C[0]]
  y = [B[1], C[1]]
  plt.plot(x, y, label='$BC$')
  x = [C[0], A[0]]
  y = [C[1], A[1]]
  plt.plot(x, y, label='$CA$')

  x = [A[0], P[0]]
  y = [A[1], P[1]]
  plt.plot(x, y, label='$AP$')
  x = [B[0], Q[0]]
  y = [B[1], Q[1]]
  plt.plot(x, y, label='$BQ$')
  x = [C[0], R[0]]
  y = [C[1], R[1]]
  plt.plot(x, y, label='$CR$')

  plt.plot(A[0], A[1], 'o')
  plt.text(A[0] * (1 + 0.1), A[1] * (1 - 0.1), 'A')
  plt.plot(B[0], B[1], 'o')
  plt.text(B[0] * (1 - 0.2), B[1] * (1), 'B')
  plt.plot(C[0], C[1], 'o')
  plt.text(C[0] * (1 + 0.03), C[1] * (1 - 0.1), 'C')

  plt.plot(P[0], P[1], 'o')
  plt.text(P[0] * (1 + 0.1), P[1] * (1 - 0.1), 'P')
  plt.plot(Q[0], Q[1], 'o')
  plt.text(Q[0] * (1 - 0.2), Q[1] * (1 - 0.1), 'Q')
  plt.plot(R[0], R[1], 'o')
  plt.text(R[0] * (1 + 0.5), R[1] * (1 - 0.1), 'R')

  plt.plot(O[0], O[1], 'o')
  plt.text(O[0], O[1], 'O')

  plt.xlabel('$x$')
  plt.ylabel('$y$')
  plt.legend(loc='best')
  plt.grid()
  plt.savefig('orthocentre.pdf')
  plt.savefig('orthocentre.eps')
  plt.show()
