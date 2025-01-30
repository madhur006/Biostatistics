# estimate the sample size for a study where they are comparing two groups.
# They want to have 80% power, assume an effect size of 0.4, and set the significance level at 0.05.

# usually 
# d = 0.2 : small effect 
# d = 0.5 : medium effect 
# d = 0.8 : large effect 
library(pwr)

# estimate sample size 
pwr.t.test(d=0.4, power=0.8, sig.level = 0.05, type = "two.sample")


# A researcher was only able to obtain 41 participants in each group (sample size is equal for both groups).
# find potential power of her study (Note: this is still prior to completing the the study). 
# She assumes the effect size will be 0.55 and sets the significance level at 0.05.

###Calculating power, equal sample sizes
pwr.t.test(n=41, d=0.55, sig.level = 0.05, type = "two.sample")

## Unequal sample sizes

pwr.t2n.test(n1=18, n2=25, d=0.55, sig.level = 0.05)
