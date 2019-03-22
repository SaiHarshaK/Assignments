import matplotlib.pyplot as plt

rw_w = [9137.261,
8036.032,
15556.767,
14836.276,
14890.987]
rw_r = [474.114,
2452.689,
6260.592,
9022.106,
9953.349]
frw_w = [1524.858,
6147.961,
11273.743,
13397.911,
18300.683]
frw_r = [1906.936,
6545.128,
11025.024,
13459.254,
18364.527]
x_cood = [1, 5, 10, 15, 20]

plt.plot(x_cood, rw_w, label = "writer", color = "blue")
plt.plot(x_cood, rw_r, label = "reader", color = "orange")
plt.plot(x_cood, frw_w, label = "writer (fair)", color = "green")
plt.plot(x_cood, frw_r, label = "reader (fair)", color = "red")

plt.xlabel('Number of writer threads')
plt.ylabel('Time (ms)')

plt.title('Worst case Waiting Times with Constant Readers')

plt.legend()

plt.savefig("4th.jpg")
plt.show()
