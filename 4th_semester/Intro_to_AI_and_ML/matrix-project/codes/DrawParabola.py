# A simple example of an animated plot
# This code generates 240 frames of Normals to the Given Parabola

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation

fig, ax = plt.subplots()

len = 200
xmax = 10
paraX = np.linspace(0 , xmax, len)
paraY = np.sqrt(4*paraX)

t = 0

# Initial plot
x = np.linspace(0, xmax, 5)
y = -t * x + 2 * t + t**3 # t values or slope of the normal
line, = ax.plot(x, y)
text = ax.text(0.60, 0.92, '', transform=ax.transAxes, fontsize=16)
text2 = ax.text(0.60, 0.85, '', transform=ax.transAxes, fontsize=16)

plt.rcParams["figure.figsize"] = (10,8)
plt.ylabel("Price")
plt.xlabel("Size (sq.ft)")
plt.ylim(-7, 7)
plt.axhline(0, color='black')
plt.plot(paraX, paraY, label='Given Parabola', color='green')
plt.plot(paraX, -paraY, color='green')

def animate(i):
    t = 5*np.sin(float(i) / 400.0)
    x = np.linspace(0, xmax, 5)
    # line.set_xdata(x)
    text.set_text("T value: %f"%(-t))
    text2.set_text("T1 value: %f"%(-t-2/t))
    line.set_ydata(-t * x + 2 * t + t ** 3)  # update the data
    plt.savefig(str(i) + '.png')
    return line, text, text2


# Init only required for blitting to give a clean slate.
def init():
    line.set_ydata(-t * x + 2 * t + t ** 3)
    return line,

ani = animation.FuncAnimation(fig, animate, frames=np.arange(1, 240), init_func=init, interval=30, blit=True)
plt.show()
