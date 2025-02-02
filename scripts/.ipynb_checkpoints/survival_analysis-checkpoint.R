# Time to Event Data

# Time from cancer diagnosis until death 
# Time from pacemaker implant until battery depletion 
# Time from starting a quit-smoking program until person resume smoking 
# Time from kidney transplant to graft loss


#  survival package 
# survminer package for ggplot2-based visualization of survival analysis results
# Surv() -  create a survival object
# survfit() - fit survival curves (Kaplan-Meier estimates)
# survdiff() - perform log-rank test comparing survival curves
# coxph() - compute the Cox proportional hazards model

# Kaplan-Meier plots : visualize survival curves
# Log-rank test : compare  survival curves of two or more groups
# Cox proportional hazards regression : describe the effect of variables on survival. 

# survival probability
# hazard  

# The Kaplan-Meier (KM) : non-parametric method used to estimate the survival probability from observed survival times

library(survival)
library(survminer)

df_lung <- lung


# compute survival curve 
fit <- survfit(Surv(time, status) ~ sex, data = df_lung)
print(fit)
summary(fit)$table

# Visualize survival curves

ggsurvplot(fit, pval = TRUE, conf.int = TRUE, 
           risk.table = TRUE, risk.table.col = "strata", 
           surv.median.line = "hv")


# Also, plot  number of censored subjects at time t
ggsurvplot(fit, pval = TRUE, conf.int = TRUE, 
           risk.table = TRUE, risk.table.col = "strata", 
           surv.median.line = "hv", 
           ncensor.plot = TRUE)

# looking for survival probability at particular time 
# median survival time for both groups : can also get from summary(fit)$table

# shorten survival curves 

ggsurvplot(fit, conf.int = TRUE,
           xlim = c(0, 650))


# plot cumulative events or cumulative incidence,

ggsurvplot(fit,
           conf.int = TRUE,
           fun = "event")

# cumulative hazard : hazard probability 
# H(t)=−log(survivalfunction)
ggsurvplot(fit,
           conf.int = TRUE,
           fun = "cumhaz")


# Log-Rank test comparing survival curves :  non-parametric tes
#  The null hypothesis is that there is no difference in survival between the two groups. 
# the log rank test compares the observed number of events in each group to what would be expected if the null hypothesis were true

surv_diff <- survdiff(Surv(time, status) ~ sex, data = df_lung)
surv_diff

#  p < 0.05, indicating that the sex groups differ significantly in survival.


# Cox proportional-hazards model : regression model commonly used statistical in medical research 
# for investigating the association between the survival time of patients and one or more predictor variables.
#  Kaplan-Meier curves and logrank tests - are univariate analysis

# Cox proportional hazards regression analysis : quantitative predictor variables and for categorical variables. 
# Cox regression model extends survival analysis methods to assess simultaneously the effect of several risk factors on survival time.

# A covariate with hazard ratio > 1 (i.e.: b > 0) is called bad prognostic factor
# A covariate with hazard ratio < 1 (i.e.: b < 0) is called good prognostic factor

# Univariate cox analysis 
res.cox <- coxph(Surv(time, status) ~ sex, data = df_lung)
res.cox

summary(res.cox)


# Multivariate Cox regression analysis

res.cox <- coxph(Surv(time, status) ~ age + sex + ph.ecog, data =  df_lung)
summary(res.cox)

# Visualizing the estimated distribution of survival times

surv_fit <- survfit(res.cox, newdata = df_lung) 
ggsurvplot(survfit(res.cox, df_lung))


# Proportional Hazard Regression 
library(survival)
kmsurv <- survfit(df_lung)









