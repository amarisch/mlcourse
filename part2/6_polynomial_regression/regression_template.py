# Regression template

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:,1:2].values
y = dataset.iloc[:,2].values

# Splitting the dataset into training and testing
'''from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)
'''

# Feature scaling


# Fitting the regression model to the dataset
# Create regressor here


# Predicting results
y_pred = regressor.predict(6.5)

# Visualizing the regression results
plt.scatter(X, y, color='red')
plt.plot(X, regressor.predict(X), color='blue')
plt.title('graph title')
plt.xlabel('x laebl')
plt.ylabel('y laebl')

# Visualizing the regression results (for higher resolution and smoother curve)
X_grid = np.arange(min(X), max(X), 0.1)
X_grid = X_grid.reshape((len(X_grid),1))
plt.scatter(X, y, color='red')
plt.plot(X_grid, regressor.predict(X_grid), color='blue')
plt.title('graph title')
plt.xlabel('x laebl')
plt.ylabel('y laebl')