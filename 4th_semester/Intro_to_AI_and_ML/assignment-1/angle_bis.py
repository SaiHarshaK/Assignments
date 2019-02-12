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


  a = np.linalg.norm(B - C)
  b = np.linalg.norm(C - A)
  c = np.linalg.norm(A - B)

  # U, V, W calculation
  U = (b * B + c * C) / (b + c)
  V = (c * C + a * A) / (c + a)
  W = (a * A + b * B) / (a + b)

  print("U: {0}".format(U))
  print("V: {0}".format(V))
  print("W: {0}".format(W))

  AU = np.vstack((A, U)).T
  BV = np.vstack((B, V)).T
  CW = np.vstack((C, W)).T

  print("The intersection of AU and BV: {0}".format(intersection(AU, BV)))
  print("The intersection of BV and CW: {0}".format(intersection(BV, CW)))
  print("The intersection of CW and AU: {0}".format(intersection(CW, AU)))

  I = (a * A + b * B + c * C) / (a + b + c)

  print("The incentre: {0}".format(I))

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

  x = [A[0], U[0]]
  y = [A[1], U[1]]
  plt.plot(x, y, label='$AU$')
  x = [B[0], V[0]]
  y = [B[1], V[1]]
  plt.plot(x, y, label='$BV$')
  x = [C[0], W[0]]
  y = [C[1], W[1]]
  plt.plot(x, y, label='$CW$')

  plt.plot(A[0], A[1], 'o')
  plt.text(A[0] * (1 + 0.1), A[1] * (1 - 0.1), 'A')
  plt.plot(B[0], B[1], 'o')
  plt.text(B[0] * (1 - 0.2), B[1] * (1), 'B')
  plt.plot(C[0], C[1], 'o')
  plt.text(C[0] * (1 + 0.03), C[1] * (1 - 0.1), 'C')

  plt.plot(U[0], U[1], 'o')
  plt.text(U[0] * (1 + 0.1), U[1] * (1 - 0.1), 'U')
  plt.plot(V[0], V[1], 'o')
  plt.text(V[0] * (1 - 0.2), V[1] * (1 - 0.1), 'V')
  plt.plot(W[0], W[1], 'o')
  plt.text(W[0] * (1 + 0.5), W[1] * (1 - 0.1), 'W')

  plt.plot(I[0], I[1], 'o')
  plt.text(I[0], I[1], 'I')

  plt.xlabel('$x$')
  plt.ylabel('$y$')
  plt.legend(loc='best')
  plt.grid()
  plt.savefig('angle_bis.pdf')
  plt.savefig('angle_bis.eps')
  plt.show()
