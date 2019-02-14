import numpy as np
import matplotlib.pyplot as plt

len = 502

t = np.linspace(-5,5,len)

t1 = -t - 2/t
t12 = t1 * t1
m = t / t * 8

plt.plot(t, t1, label='Paramter of the Normal')
plt.plot(t, t12, label='Bounds of t1 sqaured')
plt.plot(t, m, label='Straight Line y = 8')

plt.ylim(-20, 20)
plt.axhline(0, color='black')
plt.axvline(0, color='black')
plt.xlabel('$T\ Value$', fontsize=20)
plt.ylabel('$Y\ Values\ (T_{{{1}}}\ or\ T_{{{1}}}^{{{2}}})$', fontsize=20)
plt.legend(loc='best')
plt.grid() 

plt.savefig('../figures/minimisation.png')
plt.savefig('../figures/minimisation.pdf')
plt.savefig('../figures/minimisation.eps')

plt.show()
