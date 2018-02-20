# Polynomial regression
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Poly regression
# create a new column that contains the square of our level values
#dataset$Level2 = dataset$Level^2
#dataset$Level3 = dataset$Level^3
#dataset$Level4 = dataset$Level^4
# poly_reg = lm(formula = Salary ~ .,
#              data = dataset)

poly_reg = lm(formula = Salary ~ poly(Level,4),
              data = dataset)
predict(poly_reg, data.frame(Level = 6.5))

library(ggplot2)
ggplot() +
  geom_point(aes(x=dataset$Level,y=dataset$Salary), 
             color='red') +
  geom_line(aes(x=dataset$Level,y=predict(poly_reg, newdata = dataset)), 
            color='blue') +
  ggtitle('Level versus Salary') +
  xlab('Level') +
  ylab('Salary')