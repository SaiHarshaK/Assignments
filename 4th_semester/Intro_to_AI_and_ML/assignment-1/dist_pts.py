import numpy as np

if __name__ == "__main__":
  A = np.array([-2, -2])
  B = np.array([1, 3])
  C = np.array([4, -1])

  print("length of line segments, AB: {0}, BC: {1}, CA: {2}".format(np.linalg.norm(A - B), np.linalg.norm(B - C), np.linalg.norm(C - A)))
