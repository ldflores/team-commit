library(dplyr)
library(ggplot2)

# get data into dataframe

get_data <- read.csv('all-ages.csv', stringsAsFactors = FALSE, header = TRUE)

# compute salary variability column to be used in graph
selected <- get_data %>% mutate(salary_variability = P75th - P25th)
get_Major_Cat <- unique(c(selected$Major_category))

shinyServer(function(input, output) {
  # put scatter plot here as output$scatter
  output$scatter <- renderPlot({
    filtered <- selected %>% filter(Major_category == input$Major_category)
    ggplot(filtered, aes(x = salary_variability, y = Median, color = Major_category)) +
      geom_point()
  })
  
  # put boxplot here as output$boxplot
 
  
})