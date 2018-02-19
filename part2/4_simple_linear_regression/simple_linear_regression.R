# Simple Linear regression
dataset = read.csv('Salary_Data.csv')

library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)
# to get more info about the regressor, in console type:
# summary(regressor)

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)      25792.2     2273.1   11.35 5.51e-12 ***
#  YearsExperience   9450.0      378.8   24.95  < 2e-16 ***

y_pred = predict(regressor, newdata=test_set)

# Visualizing the training set results
# install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(data = training_set, aes(x=YearsExperience,y=Salary), color='red') +
  geom_line(data = training_set, aes(x=YearsExperience,y=predict(regressor, newdata = training_set)), color='blue') +
  ggtitle('Salary versus experience') +
  xlab('Years of experience') +
  ylab('Salary')

# Visualizing the test set results
# install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(data = test_set, aes(x=YearsExperience,y=Salary), color='red') +
  geom_line(data = training_set, aes(x=YearsExperience,y=predict(regressor, newdata = training_set)), color='blue') +
  ggtitle('Salary versus experience') +
  xlab('Years of experience') +
  ylab('Salary')

