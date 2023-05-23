library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")
# Define UI for application

# Load data
climate_change_data <- read.csv("climate_change_data.csv")

# User Interface
my_ui <-  navbarPage(
  title = "Assignment 4: Climate Change, Devanshi Desai",
  id = "navbar",
  
  tabPanel("Summary Information",
    h3("The Data Set"),
    
    p(style = "text-align: justify; font-size = 12px",
             "From the data set, I mainly focused on three countries that I know 
              produce the most amount of carbon emissions in the world, which are China, 
              India, and the United States. I thought it would be interesting to understand 
            how these countries have produced co2 emissions over time and what are causes 
            of their carbon emissions, for example consumption-based emissions, oil-based 
            emissions, or production-based emissions, since these are also some of the 
            major causes for increased carbon emissions world-wide."),
    
    p(style = "text-align: justify; font-size = 12px",
      "This data set was collected by the organization [Our World in Data]
      (https://ourworldindata.org/co2-and-greenhouse-gas-emissions) which uses 
      research and data to make progress against the world's largest problems 
      including climate change, disease, poverty, etc., and aims to make data 
      accessible to the public so that more people can know about these issues, 
      which can lead to change. The data in the dataset has been collected by 
      thousands of researchers and scientists over time from 1800 to 2021. Some 
      limitations of this data set are that some countries have missing values 
      for certain variables, especially less established countries, which makes 
      it difficult to understand how smaller countries are affected by climate 
      change."),
    
    h3("Summary of Variables"),
   
     p(style = "text-align: justify; font-size = 12px",
      "I found first that the country that creates the", 
      strong("most consumption based carbon emissions"), "out of these three is the
      ", strong("United States"), "with", strong("180,878.53"), "consumption-based emissions 
      of carbon dioxide (CO₂), measured in million tonnes from 1800 to 2021."),
    
    p(style = "text-align: justify; font-size = 12px",
      "I then found that the", strong("year with the highest percent growth in carbon emissions"), 
      "was", strong("1832"), "with a", strong("33.495%"), "growth in emissions 
      from the year before."),
    
    p(style = "text-align: justify; font-size = 12px",
      "Next I found that", strong("China"), "has produced", strong("34491.543 oil-based emissions"), 
      "of carbon dioxide, measured in million tonnes from 1800 to 2021."),
    
    p(style = "text-align: justify; font-size = 12px",
      "I also found that", strong("India"), "has produced", strong("37018.082 coal-based emissions"), 
      "of carbon dioxide, measured in million tonnes from 1800 to 2021."),
    
    p(style = "text-align: justify; font-size = 12px",
      "Finally, I found that", strong("the United States"), "has produced", strong("161275.016 gas-based emissions"), 
      "of carbon dioxide, measured in million tonnes from 1800 to 2021."),
    
    
    h3("Insights from Visualization"),
    p(style = "text-align: justify; font-size = 12px",
      "From my visualization, I saw that the United States has significantly higher
      oil-based carbon emissions than any other individual country in the data-set. 
      The USAs carbon emissions increased significantly after the year 1900. The 
      next highest individual country in recent years, would be China, but even 
      China produces significantly lower emissions than the USA. I also noticed 
      that almost every country in the data set had an overall upwards trend in 
      oil-based carbon emissions from 1800 to 2021, meaning that global emission rates
      have overall increased significantly in this period of time.")
    
  
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