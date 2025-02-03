library(survival)
library(survminer)
library(tidyverse)
library(ggplot2)
library(ggfortify)
library(multcomp)

df_lung <- lung

head(df_lung)

# Compute Survival Curve
kmsurv <- survfit(Surv(time, status) ~ sex, data = df_lung)


# Median survival time and its Confidence interval
kmsurv

# kmsurv

# Visualize Survival Curve 
autoplot(kmsurv) + 
  xlab('time in days') + 
  ylab('survival percent') + 
  labs(title = 'Survival Curve for Lung Cancer')+
  theme_bw() + 
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 20),
    axis.title.x = element_text(size = 16),
    axis.title.y = element_text(size = 16),
    axis.text.x = element_text(size = 14), 
    axis.text.y = element_text(size = 14))


# Log Rank Test 
survdiff(Surv(time, status) ~ sex, data = df_lung, rho = 0)

# Survival probability at different time points and its CI

summary(kmsurv, times=c(100, 250, 500, 750))

# Proportional Hazard Regression 
# Model Cox PH Regression 

model_1 <- coxph(Surv(df_lung$time, df_lung$status) ~ sex, data = df_lung)
summary(model_1)

# Checking assumption for Cox PH 
# schoenfeld residuals verses time
sch.test = cox.zph(model_1)
ggcoxzph(sch.test)

# Multiple Cox PH Regression 

model_2 <- coxph(Surv(time, status) ~ age + sex + ph.ecog, data =  df_lung)
summary(model_2)

