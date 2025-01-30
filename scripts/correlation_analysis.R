library(tidyverse)
# Correlation Test Between Two Variables in R

# Pearson correlation :  measures a linear dependence between two variables (x and y), parametric correlation 
# Kendall tau and Spearman rho :  rank-based correlation coefficients (non-parametric)

# -1 indicates a strong negative correlation 
# 0  no association
# 1 indicates a strong positive correlation

df <- read.csv('data/Advertising.csv')[, -1]
df

ggplot(df, aes(x=radio, y=sales)) + 
  geom_point() +
  geom_smooth(method=lm)


cor(df$sales, df$radio, method = "pearson", use = "complete.obs")
cor.test(df$sales, df$radio, method = "pearson")
cor.test(df$sales, df$newspaper, method = "pearson")
cor.test(df$sales, df$TV, method = "pearson")
# p value and estimate 
# If the p-value is < 0.05, then the correlation between x and y is significant.

# Kendall rank correlation test : estimate a rank-based measure of association
cor.test(df$sales, df$radio, method="kendall")




# correlation matrix (for mutiple variables)
round(cor(df), 3)



# Visualize correlation matrix : corrplot, scatterplot, heatmap

adv_cor <- cor(df)
# Positive correlations are displayed in blue and negative correlations in red color
library(corrplot)

corrplot(adv_cor, method="circle")
corrplot(adv_cor, method="color")
corrplot(adv_cor, method="number")

# reordering 
# correlogram with hclust reordering (hierarchical clustering)
corrplot(adv_cor, method="color", order="hclust")

corrplot(adv_cor, type="upper", order="hclust")

library("PerformanceAnalytics")
chart.Correlation(df, histogram=TRUE, pch=18)

 

