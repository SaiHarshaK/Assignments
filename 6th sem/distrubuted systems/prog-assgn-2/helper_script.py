import numpy as np
m = np.zeros((15,15))

with open('inp_raw.txt') as f:
    array = []
    for line in f: # read rest of lines
        array.append([int(x) for x in line.split()])
    print(array)

    for k in array:
      print(k)
      for i in range(len(k)):
        if i == 0:
          continue
        m[k[0] - 1][k[i] - 1] = 1
        m[k[i] - 1][k[0] - 1] = 1

print(m)
for i in range(len(m)):
  list = ""
  list += str(i + 1) + " "
  for j in range(len(m[0])):
    if m[i][j] == 1:
      list += str(j + 1) + " "
  print(list)
