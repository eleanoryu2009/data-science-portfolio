library(tidyverse)
data("economics")
annual_data <- economics %>%
  mutate(year=as.numeric(format(date, "%Y"))) %>%
  group_by(year) %>%
  summarise(
    avg_consumption=mean(pce),
    avg_unemployment=mean(unemploy)
  ) %>%
  filter(year >= 1980)
ggplot(annual_data, aes(x=year))+
  geom_line(aes(y=avg_consumption/1000, color="Consumption(Trillions)"), size=1.2)+
  geom_line(aes(y=avg_unemployment/100, color="Unemployment(Millions)"), size=1.2)+
  scale_color_manual(values=c("Consumption(Trillions)"="green", "Unemployment(Millions)"="orange"))+
  labs(
    title="US Economic Trends: Consumption vs Unemployment",
    subtitle="Macroeconomic indicators(1980-present)",
    x="Year",
    y="Value(Scaled)",
    color="Indicators"
  )+
  theme_minimal()+
  theme(legend.postion="bottom")

