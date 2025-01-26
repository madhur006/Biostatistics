# Normal Distribution 
# Computing probabilities using the Normal distribution
# RAND-36 test : measure of health-related quality of life. 
# One of the scores produced is a mental health score. It is assumed to be normally distributed with a mean of 50 and a standard deviation of 10.
# find probabilities from a Normal distribution, 

# Computing “less than” probabilities in a Normal distribution
# eg  finding the probability of having at most a RAND-36 mental health score of 35 (i.e., 33 or less)

pnorm(35, mean = 50, sd = 10)

# if standardized then Z score  = (33-50)/10 = -1.7
pnorm(-1.7)

# Computing “greater than” probabilities in a Normal distribution
# probability of having at least a RAND-36 mental health score of 68 (i.e., 68 or more).
pnorm(68, mean = 50, sd = 10, lower.tail = FALSE)

# Computing “between” probabilities in a Normal distribution
#  finding the probability of a RAND-36 mental health score being between 35 and 55

pnorm(55, mean = 50, sd = 10) - pnorm(35, mean = 50, sd = 10)


# Make histogram for ND 
set.seed(123) 
samples <- rnorm(1000, mean = 50, sd = 10)

# histogram of the samples
hist(samples, probability = TRUE, breaks = 30, col = "lightblue", 
     xlab = "Value", ylab = "Density", main = "Normal Distribution Histogram (mean=50, sd=10)")

#  normal curve
curve(dnorm(x, mean = 50, sd = 10), col = "blue", lwd = 2, add = TRUE)

# another way to make density plot
dens <- density(samples)
# plot density
plot(dens, frame = FALSE, col = "steelblue", 
     main = "Density plot of mean 50 and std 10") 

## qq plot 
library(car)
qqPlot(samples)

# test of normality : Shapiro-Wilk’s test
# plot qq plot and histogram
qqPlot(samples)

shapiro.test(samples)

# if p - value > 0.05 then the distribution is not different than normal 
# Hence normality assumption met. 

