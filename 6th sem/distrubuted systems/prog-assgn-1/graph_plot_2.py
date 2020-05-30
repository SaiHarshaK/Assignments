import matplotlib.pyplot as plt

var_time = [14,
18,
17,
29,
39]
x_cood = [10, 15, 20, 25, 30]

plt.plot(x_cood, var_time, label = "N = 10", color = "blue")

plt.xlabel('Number of Cells')
plt.ylabel('Seconds')

plt.title('Time of execution vs num of nodes')

plt.legend()

plt.savefig("graph2.jpg")
plt.show()
