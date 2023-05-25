library("dplyr")
library("ggplot2")
library("plotly")


climate_change_data <- read.csv("climate_change_data.csv")

#variables from summary.r document
china_cumulative_oil_co2 <- 34491.543
highest_co2_growth_prct_us <- 33.495
highest_co2_growth_year <- 1832
highest_consumption_co2 <- 180878.538
highest_consumption_country <- "United States"
india_cumulative_coal_co2 <- 37018.082
us_cumulative_gas_co2 <- 161275.016


# Server
my_server <- function(input, output, session) {
  
  output$emissions <- renderPlotly({
    
    selected_countries_years <- climate_change_data %>% 
      filter(country %in% input$user_selection) %>%
      filter(year >= input$year_range[1], year <= input$year_range[2])
  
    oil_emissions <- ggplot(selected_countries_years, aes(x = year, y = oil_co2, color = country)) + 
      geom_line() +
      labs(title = "Oil-based Carbon Emissions by Country",
           x = "Year",
           y = "Emissions")
    
    return(ggplotly(oil_emissions))
  })
  
}