# F-test is used to assess whether the variances of two populations are equal.
library(tidyverse)
library(car)

df <- read.csv('data/Heart.csv')
View(df)

# F-test
res.ftest <- var.test(RestBP ~ AHD, data = df)
res.ftest
# P VALUE > 0.05 therefore no significant difference between the variance of two group 


# Compare Multiple Sample Variances : levene test 

# Levene's test
leveneTest(RestBP ~ ChestPain, data = df_heart)
