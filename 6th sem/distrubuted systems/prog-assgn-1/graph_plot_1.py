import matplotlib.pyplot as plt

var_time = [34,
52,
77,
121,
211]
x_cood = [10, 15, 20, 25, 30]

plt.plot(x_cood, var_time, label = "k = 10", color = "blue")

plt.xlabel('Number of Cells')
plt.ylabel('Number of control messages')

plt.title('Control messages vs num of nodes')

plt.legend()

plt.savefig("graph1.jpg")
plt.show()
