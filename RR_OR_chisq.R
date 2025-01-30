library(epibasix)
#  categorical variables 
# relative risk (cohort) and odds ratio (case control, retrospective)
mymatrix <- matrix(c(140,620,180,912),
                   nrow=2,
                   ncol=2,
                   byrow = TRUE,
                   dimnames = list(c('served in Vietnam', 'not served in vietnam'),
                                   c('trouble controlling temper', 'able to control temper')))

# Calculating Proportions (Row-Wise)
prop.table(mymatrix,1)

summary(epi2x2(mymatrix))


# chi square test 
mychi.test<-chisq.test(mymatrix, correct=FALSE)
mychi.test
