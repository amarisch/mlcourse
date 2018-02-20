# Regression template

dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Split data
library(caTools)
set.seed()
sample.split(y, SplitRatio = 2/3)

# Feature scaling


# Fitting the regression model to the dataset
# Create your regressor here


# Predicting a new result with the regressor
y_pred = predict(regressor, data.frame(Level = 6.5))

# Visualizing the regressor results
library(ggplot2)
ggplot() +
  geom_point(aes(x=dataset$Level,y=dataset$Salary), 
             color='red') +
  geom_line(aes(x=dataset$Level,y=predict(poly_reg, newdata = dataset)), 
            color='blue') +
  ggtitle('Level versus Salary') +
  xlab('Level') +
  ylab('Salary')

# Visualizing the regressor results - smoother curve
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x=dataset$Level,y=dataset$Salary), 
             color='red') +
  geom_line(aes(x=x_grid,y=predict(poly_reg, newdata = data.frame(Level = x_grid))), 
            color='blue') +
  ggtitle('Level versus Salary') +
  xlab('Level') +
  ylab('Salary')
