install.packages("plotly")

library("dplyr")
library("ggplot2")
library("plotly")

climate_change_data <- read.csv("~/Desktop/climate_change_data.csv")

#include information only about india, china, and united states
selected_countries_data <- climate_change_data %>%
  filter(country %in% c("United States", "China", "India"))

co2_consumption_by_country <- selected_countries_data %>%
  group_by(country) %>%
  summarise(consumption_co2 = sum(consumption_co2, na.rm=TRUE))

#variable 1: highest consumption based co2 emissions
highest_consumption_co2 <- co2_consumption_by_country %>%
  filter(consumption_co2 == max(consumption_co2)) %>%
  pull(consumption_co2)

#variable 2: country with highest consumption based co2 emissions
highest_consumption_country <- co2_consumption_by_country %>%
  filter(consumption_co2 == max(consumption_co2)) %>%
  pull(country)

#variable 3: the year highest percentage increase in co2 emissions in US --> ASK FOR HELP
highest_co2_growth_year <- selected_countries_data %>%
  filter(country == "United States") %>%
  filter(co2_growth_prct %in% max(co2_growth_prct, na.rm = TRUE)) %>%
  pull(year)

#extra info - what was the percentage increase in co2 emissions
highest_co2_growth_prct_us <- selected_countries_data %>%
  filter(country == "United States") %>%
  filter(co2_growth_prct %in% max(co2_growth_prct, na.rm = TRUE)) %>%
  pull(co2_growth_prct)

#variable 4: cumulative oil based co2 emissions in china
china_cumulative_oil_co2 <- selected_countries_data %>%
  filter(country == "China") %>%
  filter(year == max(year)) %>%
  pull(cumulative_oil_co2)
  
#variable 5: cumulative coal based co2 emissions in india
india_cumulative_coal_co2 <- selected_countries_data %>%
  filter(country == "India") %>%
  filter(year == max(year)) %>%
  pull(cumulative_coal_co2)
  
