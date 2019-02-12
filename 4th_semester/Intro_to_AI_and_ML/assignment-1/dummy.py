import numpy as np
def mid_pt(B,C):
  D = (B+C)/2
  return D
def norm_vec(AB):
  print(np.matmul(AB,dvec), "hi")
  return np.matmul(omat,np.matmul(AB,dvec))
def line_intersect(AD,CF):
  n1 = norm_vec(AD)
  n2 = norm_vec(CF)
  print(n2)
  N =np.vstack((n1,n2))
  p = np.zeros(2)
  p[0] = np.matmul(n1,AD[:,0])
  p[1] = np.matmul(n2,CF[:,0])
  return np.matmul(np.linalg.inv(N),p)

A = np.array([-2,-2], dtype=np.float)
B = np.array([1,3], dtype=np.float)
C = np.array([4,-1], dtype=np.float)
D = mid_pt(B,C)
F = mid_pt(A,B)
# print D, F
AD = np.vstack((A,D)).T
CF = np.vstack((C,F)).T
dvec = np.array([-1,1], dtype=np.float)
omat = np.array([[0,1],[-1,0]], dtype=np.float)
print(line_intersect(AD,CF))
