# Comparing Mean
#  T-test
# Wilcoxon test
# ANOVA test and
# Kruskal-Wallis test

# Comparing one-sample mean to a standard known mean : one sampel t-test and one sample wilcoxon test 

# One sample t-test :  used to compare the mean of one sample to a known standard mean (or theoretical/hypothetical) 

# theoretical mean comes from: a previous experiment. For example, compare whether the mean weight of mice differs from 200 mg, a value determined in a previous study.
#  from an experiment where you have control and treatment conditions. 

# research question 
# whether the mean (m) of the sample is equal to the theoretical mean (μ)?
# whether the mean (m) of the sample is less than the theoretical mean (μ)?
# whether the mean (m) of the sample is greater than the theoretical mean (μ)?

# Null and Alternate Hypothesis

library(tidyverse)


df_heart <- read.csv('data/Heart.csv')
View(df_heart)
glimpse(df_heart)

summary(df_heart$RestBP)

# Is resting BP in people with HR different than 80 
res <- t.test(df_heart$RestBP, mu = 80)
res

# Is restig BP in people with HR less than 80 
t.test(df_heart$RestBP, mu = 80, alternative = "less")

# # Is restig BP in people with HR more than 80 
t.test(df_heart$RestBP, mu = 80, alternative = "greater")


res$p.value
res$conf.int
res$estimate # mean 


# one-sample Wilcoxon signed rank test :  used to determine whether the median of the sample is equal to a known standard value (i.e. theoretical value).
# whether the median (m) of the sample is equal to the theoretical value (m0)?

wilcox.test(df_heart$RestBP, mu = 80, alternative = "two.sided")


# Comparing the means of two independent groups:
# Unpaired Two-Samples T-test in R
# Unpaired Two-Samples Wilcoxon Test

# unpaired two-samples t-test can be used only under certain conditions: (for < 30 observations)
# when the two groups of samples (A and B), being compared, are normally distributed. 
#  when the variances of the two groups are equal. This can be checked using F-test.
#  Null Hypothesis 
#  H0:mA=mB
#  H0:mA≤mB
#  H0:mA≥mB
# alternative hypotheses 
#  Ha:mA≠mB (different)
#  Ha:mA>mB (greater)
#  Ha:mA<mB (less)


# compare the mean of two independent groups.
df_heart %>% 
  count(AHD)

# Observations more than 30 - dont need normality assumption check


# # t-test : Does the mean resting BP is different in people with Atherosclerotic Heart disease and not. 
res <- t.test(RestBP ~ AHD, data = df_heart, var.equal = TRUE)
res

res$estimate
res$conf.int
res$p.value

# Comparing the means of paired samples
# The paired samples t-test is used to compare the means between two related groups of samples. 
# example :  10 mice received a treatment X during 5 months. We want to know whether the treatment X has an impact on the weight of the mice.

# Weight of the mice before treatment
before <-c(200.1, 190.9, 192.7, 213, 241.4, 196.9, 172.2, 185.5, 205.2, 193.7)
# Weight of the mice after treatment
after <-c(392.9, 393.2, 345.1, 393, 434, 427.9, 422, 383.9, 392.3, 352.2)

df_mice <- data.frame( 
  group = rep(c("before", "after"), each = 10),
  weight = c(before,  after)
)

df_mice


res <- t.test(df_mice$weight[df_mice$group == "before"],
              df_mice$weight[df_mice$group == "after"],
              paired = TRUE)
res


# Comparing the means of more than two groups
# Analysis of variance (ANOVA, parametric):
#  One-Way ANOVA Test in R
#  Two-Way ANOVA Test in R
#  MANOVA Test in R: Multivariate Analysis of Variance

# summmary statistics 

df_heart %>% 
  group_by(ChestPain) %>% 
  summarise(mean(RestBP))

ggplot(df_heart, aes(x = ChestPain, y = RestBP)) + 
  geom_boxplot()

#any difference in RestBP in the different kind of chest pain 
res.aov <- aov(RestBP ~ ChestPain, data =  df_heart)
summary(res.aov)

# Tukey multiple pairwise-comparisons :  which pairs of groups are different.
TukeyHSD(res.aov)

# we see that there is a significant different in resting BP between typical and non typical chest pain. 
pairwise.t.test(df_heart$RestBP, df_heart$ChestPain,
                p.adjust.method = "BH")

# Check ANOVA assumptions
# The ANOVA test assumes :  data are normally distributed 
# and variance across groups are homogeneous. 
# We can check that with some diagnostic plots.

# Homogeneity of variances
plot(res.aov, 1)

# levene test 
library(car)
leveneTest(RestBP ~ ChestPain, data = df_heart)
# p-value > 0.05 :  no evidence variance across groups is statistically significantly different. 
# assume the homogeneity of variances in the different treatment groups

# if the assumption of variance not hold we can use 
oneway.test(RestBP ~ ChestPain, data = df_heart)

# normality assumption 
plot(res.aov, 2)

# Non-parametric alternative to one-way ANOVA test

kruskal.test(RestBP ~ ChestPain, data = df_heart)
