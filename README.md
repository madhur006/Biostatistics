# Biostatistics

## Project Structure

-   `data/` - Directory containing datasets
-   `r_jupyter_notebooks` - Jupyter notebooks that integrate R code with analysis
    -   `Matching.ipynb` - propensity score matching, nearest neighbor
    -   `survival_analysis.ipynb` - Kaplan-Meier curve, log rank test, Cox Proportional-Hazards Model
-   `scripts/` - Directory containing R scripts
    -   `compare_means_btw_groups.R` - one and two sample t-test, paired t-test, ANOVA
    -   `compare_variance_btw_groups.R` - F-test, Levene's test
    -   `correlation_analysis.R` - correlation and visualization
    -   `power_sample_size_estimation.R` - calculate power and sample size
    -   `probability_distribition.R` - calculate probability based on Normal and Binomial distribution
    -   `RR_OR_chisq.R` - relative risk, odds ratio, chi square test and Fisher Test 
    -   `survival_analysis.R` - Kaplan-Meier curve, log rank test, Cox Proportional-Hazards Model
-   `README.md` - Project documentation
