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
df_heart <- read.csv('data/Heart.csv')
View(df_heart)

## Association between chest pain and AHD
# Create contingency table
contingency_table <- table(df_heart$ChestPain, df_heart$AHD)
contingency_table

# pearson chisq test 
mychi.test<-chisq.test(contingency_table, correct=FALSE)
mychi.test


# for small sample size - fisher 
fisher_result <- fisher.test(contingency_table)
print(fisher_result)
