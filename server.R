library("dplyr")
library("ggplot2")
library("plotly")


climate_change_data <- read.csv("~/Desktop/climate_change_data.csv")

# Server
my_server <- function(input, output) {
  
  output$oil_emissions <- renderPlotly({
    
    selected_countries_data <- climate_change_data %>% filter(country %in% input$user_selection)

    oil_emissions <- ggplot(selected_countries_data, aes(x = year, y = oil_co2, color = country)
                            + geom_line()
                            + labs(title = "Oil-based Carbon Emissions by Country",
                                 x = "Year",
                                 y = "Emissions")
    
    return(ggplotly(oil_emissions,  tooltip = "text"))
  })
}