#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Feb 14 11:24:04 2018

@author: chen
"""

# Data Preprocessing

import numpy as np
import matplotlib as plt
import pandas as pd 

# importing the dataset
dataset = pd.read_csv('Data.csv')
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:,3].values

# Taking care of missing data
# SKlearn preprocessing library
from sklearn.preprocessing import Imputer
imputer = Imputer(missing_values='NaN', strategy='mean', axis=0)
imputer = imputer.fit(X[:,1:])
X[:,1:] = imputer.transform(X[:, 1:])

"""
Dataset after filling the missing data
array([['France', 44.0, 72000.0],
       ['Spain', 27.0, 48000.0],
       ['Germany', 30.0, 54000.0],
       ['Spain', 38.0, 61000.0],
       ['Germany', 40.0, 63777.77777777778],
       ['France', 35.0, 58000.0],
       ['Spain', 38.77777777777778, 52000.0],
       ['France', 48.0, 79000.0],
       ['Germany', 50.0, 83000.0],
       ['France', 37.0, 67000.0]], dtype=object)
"""

# encoding categorical variable
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelencoder_x = LabelEncoder()
X[:,0] = labelencoder_x.fit_transform(X[:,0])

"""
Now the country category becomes 0,1,or 2, but the numbers indicate an order.
TO ensure that we don't indicate an order, we use onehotencoder
array([[0, 44.0, 72000.0],
       [2, 27.0, 48000.0],
       [1, 30.0, 54000.0],
       [2, 38.0, 61000.0],
       [1, 40.0, 63777.77777777778],
       [0, 35.0, 58000.0],
       [2, 38.77777777777778, 52000.0],
       [0, 48.0, 79000.0],
       [1, 50.0, 83000.0],
       [0, 37.0, 67000.0]], dtype=object)
"""

# This ensures that the machine learning model does't attribute an order
# to the dummy variables
onehotencoder = OneHotEncoder(categorical_features=[0])
X = onehotencoder.fit_transform(X).toarray()

"""
Now the matrix looks like this:
    
1	0	0	44	72000
0	0	1	27	48000
0	1	0	30	54000
0	0	1	38	61000
0	1	0	40	63777.8
1	0	0	35	58000
0	0	1	38.7778	52000
1	0	0	48	79000
0	1	0	50	83000
1	0	0	37	67000

"""

# for the purchase column because it is a dependent var, we can just label
# encode it to 0 and 1
labelencoder_y = LabelEncoder()
y = labelencoder_y.fit_transform(y)

# Splitting the dataset into the training set and test set
# the test_size is at larest 0.4 but usually around 0.2 or 0.25
from sklearn.cross_validation import train_test_split
x_train, x_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=0)

# Feature scaling - standardization or Normalization
# We determine whether feature scaling is needed for the dummy variables.
# here we are doing feature scaling to the dummy varliables.
from sklearn.preprocessing import StandardScaler
sc_x = StandardScaler()
x_train = sc_x.fit_transform(x_train)
x_test = sc_x.transform(x_test)

"""
Now all number range from -1 to 1:
    
-1	2.64575	-0.774597	0.263068	0.123815
1	-0.377964	-0.774597	-0.253501	0.461756
-1	-0.377964	1.29099	-1.9754	-1.53093
-1	-0.377964	1.29099	0.0526135	-1.11142
1	-0.377964	-0.774597	1.64059	1.7203
-1	-0.377964	1.29099	-0.0813118	-0.167514
1	-0.377964	-0.774597	0.951826	0.986148
1	-0.377964	-0.774597	-0.597881	-0.482149

"""