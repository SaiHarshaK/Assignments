import matplotlib.pyplot as plt

dphil_avg = [0.0588,
0.51918,
0.830115,
0.7795865,
0.734885]
dphil_worst = [0.217,
3.1415,
4.1295,
6.359,
5.926]
x_cood = [1, 5, 10, 15, 20]

plt.plot(x_cood, dphil_avg, label = "average time", color = "blue")
plt.plot(x_cood, dphil_worst, label = "worst time", color = "orange")

plt.xlabel('Number of philosopher threads')
plt.ylabel('Time (ms)')

plt.title('Average and Worst case Waiting Times for philosophers')

plt.legend()

plt.savefig("graph.jpg")
plt.show()
