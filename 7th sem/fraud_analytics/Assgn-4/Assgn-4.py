"""
CS6890 - Assignment 4 - Example dependent cost sensitive classification using deep neural net

Authors:
    Sai Harsha K -- CS17BTECH11036
    Tanmay R     -- CS17BTECH11042
"""
import torch
import torch.nn.functional as F
import torch.nn as nn
import pandas as pd
from sklearn.model_selection import train_test_split
import numpy as np
from sklearn.metrics import f1_score

# set seed
torch.random.manual_seed(0)

# load the dataset and initialize variables
df = pd.read_csv("dataset.csv")
df = df.replace(np.nan,0)

epochs, input_dim, output_dim = 2000, 11, 1
cost_tp, cost_fp, cost_tn = 150, 150, 0

# Constants for training the model
train, test = train_test_split(df, test_size=0.3, random_state=42)

# get fn cost
cost_fn_train = torch.tensor(train['FNC'].values)
cost_fn_test = torch.tensor(test['FNC'].values)
train = train.drop(['FNC'],axis=1)
test = test.drop(['FNC'],axis=1)

# training
X_train = np.array(train.iloc[:,1:len(df.columns)])
y_train = np.array(train.iloc[:,0:1])
X_train = torch.tensor(X_train, dtype=torch.float)
y_train = torch.tensor(y_train).view(-1)

# testing
X_test = np.array(test.iloc[:,1:len(df.columns)])
y_test = np.array(test.iloc[:,0:1])
X_test = torch.tensor(X_test, dtype=torch.float)
y_test = torch.tensor(y_test).view(-1)

# Create model class
class NeuralNetwork(torch.nn.Module):
  """Definition for NeuralNetwork. It takes output_dim dimensional input data and
  returns probabilistic score of input to predicted class.
  If score is towards 0 then it belong to class 0, if it is towards 1 it belongs to class 1.
  We take a threashold value of 0.5 later during metric calculation.

  N Dimension Input Layer --> Linear Layer --> Sigmoid

  Attributes:
    input_dim  -- no of features in the input data
    output_dim -- no of features in output layer, since we do binary clasification, 1 is enough
  """
  def __init__(self, input_dim, output_dim):
    super(NeuralNetwork, self).__init__()
    self.fc1 = torch.nn.Linear(input_dim, 8)
    self.fc2 = torch.nn.Linear(8, 1)


  def forward(self, x):
    """Run the NueralNetwork on the given data, and output the sigmoid score

    Attributes:
        x -- Input Data with `input_dim` features

    Outputs:
        sigmoid score for each data point in [0, 1]
    """
    x = F.relu(self.fc1(x))
    return torch.sigmoid(self.fc2(x))

  def costSenstitiveLoss(self, pred, label, cost_fn):
    """The Loss function considered for the Logistic regression to calculate loss and
    learn weights accordingly

    Attributes:
        pred -- Scores for each data point in [0, 1]
        label -- Label for data point, 1 if fraud, 0 if genuine
        FNC -- False negative cost for misclassifying fraudulent person as genuine

    Outputs:
        calculated loss, a scalar
    """
    pred = pred.view(-1)
    loss = (label * (pred * cost_tp + (1 - pred) * cost_fn)
              + (1 - label) * (pred * cost_fp + (1 - pred) * cost_tn))
    return torch.mean(loss)

# search over the following list to find out that lr = 1e-6 gave best result
# for the sake of reducing time taken to execute we will directly take this value
# lr_rates = [1e-4, 5e-4, 1e-5, 5e-5, 1e-6, 5e-6, 1e-7, 5e-7, 1e-8]
lr_rates = [5e-5]
for lr_rate in lr_rates:
  model = NeuralNetwork(input_dim, output_dim)
  optimizer = torch.optim.SGD(model.parameters(), lr=lr_rate)

  for epoch in range(int(epochs)):
    optimizer.zero_grad()
    outputs = model(X_train)
    loss = model.costSenstitiveLoss(outputs, y_train, cost_fn_train)
    loss.backward()
    optimizer.step()

    if epoch % 200 == 0:
      # calculate Accuracy
      outputs_train = outputs.view(-1)
      predicted_train = outputs_train >= 0.5
      loss_train = loss
      accuracy_train = (predicted_train == y_train).sum() / y_train.size(0)
      f1_train = f1_score(y_train, predicted_train, average='binary')
      print("Iteration(train): {}. Loss: {}. Accuracy: {}. F1 score: {}.".format(
        (epoch / 200) + 1, loss_train.item(), accuracy_train, f1_train))

  outputs_test = model(X_test).view(-1).detach()
  predicted_test = outputs_test >= 0.5
  accuracy_test = (predicted_test == y_test).sum() / y_test.size(0)
  f1_test = f1_score(y_test, predicted_test, average='binary')
  print("Test dataset: Accuracy: {}. F1 score: {}.".format(
    accuracy_test, f1_test))

