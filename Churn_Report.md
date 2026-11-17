# Customer Churn Prediction: Business & Statistical Analysis
## 1. Project Background
In the subscription economy, customer retention is the primary driver of sustainable growth. This project aims to transition from reactive to proactive retention by building a machine learning pipeline to identify at-risk customers.
## 2. Statistical Methodology
-Robustness: Instead of relying on a single train-test split, a 5-Fold Cross-Validation was applied. The model achieved a mean accuracy of 80.26% with a standard deviation of only 0.0087, proving that the results are highly stable and not due to random chance.
-Interpretability: While complex models (like Random Forest) often achieve high accuracy, they are "black boxes." We chose Logistic Regression because its coefficients provide direct economic intuition-allowing us to quantify exactly how much each feature drives churn probability.
## 3. Deep Dive: Consumer Behavior Insights
-The Premium Price Paradox: The model revealed a surprising insight: "Monthly charges" are the strongest positive predictor of churn. This suggests that high-paying customers are not necessarily satisfied; they may feel a lack of "perceived value" for the premium they pay.
-Friction in Digital Billing: Paperless billing users churn more. This could be because digitally-native users face extremely low switching costs and are more responsive to competitor promotions.
-Contractual Lock-in: Month-to-month contracts are highly correlated with churn, highlighting that short-term users lack the psychological commitment of long-term contract holders.
## 4. Strategic BTM Recommendations
-Dynamic Retention Pricing: Instead of offering flat discounts to everyone, use the model's predictions to offer personalized incentives (e.g. 1-month free upgrades) specifically to high-charge, month-to-month customers a week before their billing date.
-Value-Added Bundles: For high-paying churn risks, shift the conversation from price to value-offer premium bundles (e.g. faster internet, free streaming subscriptions) to increase sunk costs and stickiness.
-Contract Migration Campaign: Design targeted campaigns with strong economic incentives to migrate month-to-month users to annual contracts, thereby reducing revenue volatility.
