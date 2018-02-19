# Multiple linear regression in R

dataset = read.csv('50_Startups.csv')

dataset$State = factor(dataset$State,
                         levels=c('New York', 'California', 'Florida'),
                         labels=c(1,2,3))
# R automatically creates the dummy variables and avoids the dummy variable trap

library(caTools)
set.seed(123)
# split based on dependent variable column
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split==TRUE)
test_set = subset(dataset, split==FALSE)

# Feature scaling - we don't have to do it manually

# fitting multiple linear regression to the training set
# Profit as a linear combination of all the variables
#regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
regressor = lm(formula = Profit ~ .,
               data = training_set)

# predicting test set results
y_pred = predict(regressor, newdata = test_set)

# Building the optimal model sing Backward Elimination
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend,
               data = dataset)
summary(regressor)
