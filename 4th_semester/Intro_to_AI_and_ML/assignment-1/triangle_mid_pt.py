import numpy as np

def mid_pt(A, B):
  return (A + B) / 2

if __name__ == "__main__":
  A = np.array([-2, -2])
  B = np.array([1, 3])
  C = np.array([4, -1])

  print("Co-od D: " + str(mid_pt(B, C)))
  print("Co-od E: " + str(mid_pt(C, A)))
  print("Co-od F: " + str(mid_pt(A, B)))
