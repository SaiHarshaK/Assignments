import numpy as np
import matplotlib.pyplot as plt

A = np.array([-2, -2])
B = np.array([1, 3])
C = np.array([4, -1])

len = 10

lam_1 = np.linspace(0, 1, len)

x_AB = np.zeros((2, len))
x_BC = np.zeros((2, len))
x_CA = np.zeros((2, len))

for i in range(len):
  temp1 = A + lam_1[i] * (B - A)
  x_AB[:, i] = temp1.T
  temp2 = B + lam_1[i] * (C - B)
  x_BC[:, i] = temp2.T
  temp3 = C + lam_1[i] * (A - C)
  x_CA[:, i] = temp3.T

plt.plot(x_AB[0, :], x_AB[1, :], label='$AB$')
plt.plot(x_BC[0, :], x_BC[1, :], label='$BC$')
plt.plot(x_CA[0, :], x_CA[1, :], label='$CA$')

plt.plot(A[0], A[1], 'o')
plt.text(A[0] * (1 + 0.1), A[1] * (1 - 0.1), 'A')
plt.plot(B[0], B[1], 'o')
plt.text(B[0] * (1 - 0.2), B[1] * (1), 'B')
plt.plot(C[0], C[1], 'o')
plt.text(C[0] * (1 + 0.03), C[1] * (1 - 0.1), 'C')

plt.xlabel('$x$')
plt.ylabel('$y$')
plt.legend(loc='best')
plt.grid() # minor
#if using termux
plt.savefig('triangle.pdf')
plt.savefig('triangle.eps')
#subprocess.run(shlex.split("termux−open ../figs/triangle.pdf"))
#else
plt.show()
