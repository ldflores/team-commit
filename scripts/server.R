library(dplyr)
library(ggplot2)

# get data into dataframe

data <- read.csv(file = 'all-ages.csv', stringsAsFactors = FALSE, header = TRUE)

# compute salary variability column to be used in graph
selected <- data %>% mutate(salary_variability = P75th - P25th)

shinyServer(function(input, output) {
  # put scatter plot here as output$scatter
  output$scatter <- renderPlot({
    filtered <- selected %>% filter(Major_category == input$data)
    ggplot(filtered, aes(x = salary_variability, y = Median, color = Major_category)) +
      geom_point()
  })
  
  # put boxplot here as output$boxplot
  
  
})