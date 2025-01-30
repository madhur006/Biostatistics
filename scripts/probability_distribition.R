# Normal Distribution 

# RAND-36 test : measure of health-related quality of life. 
# mental health score. It is assumed to be normally distributed with mean of 50 and a SD 10 

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


# test of normality : qqplot, Shapiro-Wilk’s test

library(car)
qqPlot(samples)
shapiro.test(samples)

# if p - value > 0.05 then the distribution is not different than normal; Hence normality assumption met. 


# Computing probabilities using the Normal distribution

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



# Binomial Distribution

# Suppose the RAND-36 mental health score is converted into a categorical variable-Normal and Frail-and
# suppose the probability of being Frail is 15.8%.
# if we obtained a random sample of 16 people, what is the probability that 6 of them will be classified as
# Frail on the RAND-36 mental health assessment?
# Computing “equal to” probabilities
dbinom(6, size = 16, prob = 0.158)

# Computing “less than or equal to” probabilities
#  find the probability that 6 or less of them will be classified as Frail
pbinom(6, size = 16, prob = 0.158)

# More than or equal to probability 
pbinom(5, size = 16, prob = 0.158, lower.tail = FALSE)

# or 
1 - pbinom(5, size = 16, prob = 0.158)

# “between” probabilities 
# probability that between 1 and 4 out of the 16 will be classified as Frail on the RAND-36 mental health assessment
pbinom(4, size = 16, prob = 0.158) - pbinom(0, size = 16, prob = 0.158)






