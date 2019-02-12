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

  a = np.linalg.norm(B - C)
  b = np.linalg.norm(C - A)
  c = np.linalg.norm(A - B)

  I = (a * A + b * B + c * C) / (a + b + c)

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

  plt.plot(A[0], A[1], 'o')
  plt.text(A[0] * (1 + 0.1), A[1] * (1 - 0.1), 'A')
  plt.plot(B[0], B[1], 'o')
  plt.text(B[0] * (1 - 0.2), B[1] * (1), 'B')
  plt.plot(C[0], C[1], 'o')
  plt.text(C[0] * (1 + 0.03), C[1] * (1 - 0.1), 'C')

  plt.Circle((I[0], I[1]), np.linalg.norm(I - A))

  plt.plot(I[0], I[1], 'o')
  plt.text(I[0], I[1], 'I')

  plt.xlabel('$x$')
  plt.ylabel('$y$')
  plt.legend(loc='best')
  plt.grid()
  plt.savefig('circumcircle.pdf')
  plt.savefig('circumcircle.eps')
  plt.show()
