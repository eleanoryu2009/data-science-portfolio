# E-commerce Discount Strategy: Revenue & Volatility Analysis
## 1. Project Background
Promotional pricing is a powerful lever in e-commerce, but "blanket discounting" often destroys brand equity and profit margins. This project simulates a tiered discount strategy to evaluate how different discount depths impact the true net revenue distribution.
## 2. Statistical Methodology
-Feature Engineering: We engineered a simulated business rule: products with a base weight > 1 unit received a 15% deep discount, while standard items received a 5% discount.
-Visualizing Variance: We used Boxplots in R to analyze not just the average revenue, but the interquartile range (IQR). The variance of revenue is a crucial risk metric for any business.
## 3. Deep Dive: Market Behavior Insights (Based on Boxplot Analysis)
-The Volatility Trap: The 15% deep discount group exhibited a massive variance in net revenue (wider interquartile range). This means deep discounts attract highly heterogeneous buying behaviors, making financial forecasting incredibly difficult.
-Margin Erosion vs. Volume Growth: While deep discounts on premium items drive high absolute revenue, the "profit compression" is severe.
-Stability of Standard Items: The 5% discount group showed highly concentrated, stable net revenue (tighter distribution), proving that standard items should be protected as the "cash cow" of the platform.
## 4. Strategic BTM Recommendations
-Decouple Traffic from Margin: Deep discounts (15%) should never be applied site-wide. They should be used strictly as "Loss-Leaders" on a few premium items to drive traffic to the platform.
-Cross-Selling Strategy: Once users are attracted by the deep-discounted premium items, use algorithmic recommendations to cross-sell standard items (with 5% discount) to recover the lost margins.
-Dynamic Pricing Engine: Move away from static discount tiers. Implement a real-time machine learning model that adjusts discount rates based on inventory levels, user purchase history, and competitor pricing to maximize both volume and margin.
