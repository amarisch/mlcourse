# data processing

dataset = read.csv('Data.csv')
dataset = dataset[, 2:3]

# TAking care of missing data
dataset$Age = ifelse(is.na(dataset$Age),
                    ave(dataset$Age, FUN=function(x) mean(x, na.rm = TRUE)),
                    dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary),
                     ave(dataset$Salary, FUN=function(x) mean(x, na.rm = TRUE)),
                     dataset$Salary)

# Encoding categorical data
# c is a vector in R
dataset$Country = factor(dataset$Country,
                         levels=c('France', 'Spain', 'Germany'),
                         labels=c(1,2,3))

dataset$Purchased = factor(dataset$Purchased,
                         levels=c('No', 'Yes'),
                         labels=c(0,1))

# Splitting the dataset into training and test sets
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split==TRUE)
test_set = subset(dataset, split==FALSE)

# feature scaling
# we are not including the categorical variables because they are not
# numeric values (vectors in R are not numeric)
# training_set[,2:3] = scale(training_set[, 2:3])
# test_set[, 2:3] = scale(test_set[, 2:3])