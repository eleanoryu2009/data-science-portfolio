# 1. Load Essential Libraries
library(tidyverse)
# 2. Load Dataset
data("economics")
# 3. Data Cleaning & Feature engineering
# Aggregate monthly data into annual data to observe long-term macroeconomic trends
annual_data <- economics %>%
# Extract the year from the date column
  mutate(year=as.numeric(format(date, "%Y"))) %>%
# Group the data by year
  group_by(year) %>%
# Calculate the annual average of personal consumption and unemployment
  summarise(
    avg_consumption=mean(pce),
    avg_unemployment=mean(unemploy)
  ) %>%
# Filter the data to focus on modern economy from 1980 to present
  filter(year >= 1980)
# 4. Data Visualization
# Create a dual-line chart to compare consumption and unemployment trends
ggplot(annual_data, aes(x=year))+
# Plot consumption(scaled down by 1000 for visual comparison)
  geom_line(aes(y=avg_consumption/1000, color="Consumption(Trillions)"), size=1.2)+
# Plot unemployment(scaled down by 1000 for visual comparison)
  geom_line(aes(y=avg_unemployment/100, color="Unemployment(Millions)"), size=1.2)+
# Customize line colors
  scale_color_manual(values=c("Consumption(Trillions)"="green", "Unemployment(Millions)"="orange"))+
# Add professional titles and axis labels
  labs(
    title="US Economic Trends: Consumption vs Unemployment",
    subtitle="Macroeconomic indicators(1980-present)",
    x="Year",
    y="Value(Scaled)",
    color="Indicators"
  )+
# Apply a clean, professional theme
  theme_minimal()+
  theme(legend.postion="bottom")
# 5. Economic insights
# 1. Consumption Trend: The green line shows a steady and continuous upward trend, indicating long-term economic growth without severe drops.
# 2. Unemployment Cycle: The orange line exhibits clear cyclical fluctuations. Notably, it spikes and peaks around 2010, a period historically associated with the aftermath of the 2008 Financial Crisis and slow labor market recovery.
# 3. Macro Relationship: While long-term consumption grows steadily, unemployment oscillates significantly, showing short-term shocks in the labor market.