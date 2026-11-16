# 1. Load Essential Library
library(tidyverse)
# 2. Load the Dataset
data("diamonds")
# 3. Data Cleaning & Feature Engineering
# We simulate a tiered discount strategy for the e-commerce platform.
ecommerce_data <- diamonds %>%
  # Clean data: Remove extreme outliers
  filter(price>0, carat<2.5) %>%
  # Feature Engineering: Create a new variable 'discount_tier'
  # Business Rule: Products heavier than 1 unit get a 15% discount; others get 5%.
  mutate(
    discount_tier=ifelse(carat>1, "15% Discount", "5% Discount"),
    # Calculate the actual net revenue after the discount is applied
    net_revenue=price*(1-ifelse(carat>1, 0.15, 0.05))
  ) %>%
  # Randomly sample 10% of the data to make the plot clean and run faster
  sample_frac(0.1)
# 4. Data Visualization: Comparing Net Revenue across Discount Tiers.
ggplot(ecommerce_data, aes(x=discount_tier, y=net_revenue, fill=discount_tier))+
  # Use a boxplot to compare the revenue distribution between the two discount groups
  geom_boxplot(alpha=0.7, outlier.alpha=0.2)+
  # Customize colors: 5% discount in blue, 15% discount in green
  scale_fill_manual(values=c("5% Discount=blue", "15% Discount=green"))+
  # Add professional titles and axis labels
  labs(
    title="E-commerce Strategy: Impact of Discounts on Net Revenue",
    subtitle="Analyzing net revenue distribution under different discount tiers",
    x="Discount Tier",
    y="Net Revenue($)",
    fill="Discount Strategy"
  )+
  # Apply a clean, professional theme
  theme_minimal()+
  # Hide the legend
  theme(legend.position="none")
# 5. Business Insights
# The 15% discount group shows a much wider interquartile range, indicating that deep discounts make net revenue highly volatile and unpredictable.
# The 5% discount group has a much tighter distribution, suggesting that smaller, targeted discounts provide more stable and predictable profits.
# E-commerce platforms should avoid applying blanket deep discounts across all products. Instead, they should use deep discounts only as a targeted strategy for premium items to drive traffic, while protecting margins on standard items.