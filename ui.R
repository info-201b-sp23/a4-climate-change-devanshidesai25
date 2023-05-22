# Define UI for application

# Load data
climate_change_data <- read.csv("~/Desktop/climate_change_data.csv")

# User Interface
my_ui <- fluidPage(
  
  h1("Assignment 4: Climate Change", align="center"),
  h2("Devanshi Desai", align="center"),
  
  plotlyOutput(outputId = "oil_emissions"),
  
  selectInput(
    inputId = "user_selection",
    label = "Countries",
    choices = climate_change_data$country,
    selected = "United States",
    multiple = TRUE
  )
  

)