# 1. Load Essential Library
library(tidyverse)
# 2. Simulate A/B Test Data
# Group A: Old UI(10% conversion rate)
# Group B: New UI(12% conversion rate)
set.seed(123)
group_A <- rbinom(1000, 1, 0.1)
group_B <- rbinom(1000, 1, 0.12)
# 3. Bootsrapping: Calculate the difference in means 1000 times
bootstrap_diffs <- replicate(1000, {
  sample_A <- sample(group_A, replace=TRUE)
  sample_B <- sample(group_B, replace=TRUE)
  mean(sample_B)-mean(sample_A)
})
# 4. Visualization: Histogram with 95% Confidence Interval
ggplot(data.frame(diff=bootstrap_diffs), aes(x=diff))+
  geom_histogram(bins=30, fill="blue", color="black", alpha=0.7)+
# Add 95% CI Lines
  geom_vline(xintercept=quantile(bootstrap_diffs, 0.025), color="red", linetype="dashed", size=1)+
  geom_vline(xintercept=quantile(bootstrap_diffs, 0.975), color="red", linetype="dashed", size=1)+
  labs(
    title="A/B Testing: Bootstrap Distribution of Conversion Rate Difference",
    subtitke="Estimating the 95% Confidence Interval via 1000 resamples",
    x="Difference in Conversion Rate (group B-group A)",
    y="Frequency"
  )+
  theme_minimal()
# 5. Statistical Insights
# The red dashed lines represent the 95% Confidence Interval
# Since the entire interval is above zero, we can conclude that the new UI(group B) has a statistically significant higher conversion rate than the old UI(group A).
