library("dplyr")
library("ggplot2")
library("plotly")
# Define UI for application

# Load data
climate_change_data <- read.csv("~/Desktop/climate_change_data.csv")

# User Interface
my_ui <-  navbarPage(
  title = "Assignment 4: Climate Change, Devanshi Desai",
  id = "navbar",
  
  tabPanel("Summary Information",
    includeMarkdown("~/Desktop/info201/assignments/a4-climate-change-devanshidesai25/index.Rmd")    
  ),
  
  tabPanel("Visualization",
    plotlyOutput(outputId = "emissions"),
           
    selectInput(
    inputId = "user_selection",
    label = "Countries",
    choices = climate_change_data$country,
    selected = "United States",
    multiple = TRUE
    ),
    
    sliderInput(
      inputId = "year_range",
      label = "Select Year Range:",
      min = 1800,
      max = 2021,
      value = c(1800, 2021),
      step = 1
    )
  )
  
)