library(dplyr)
library(ggplot2)

# get data into dataframe
data <- read.csv('all-ages.csv', stringsAsFactors = FALSE)

# compute salary variability column to be used in graph
selected <- data %>% mutate(salary_variability = P75th - P25th)

shinyServer(function(input, output) {
  # put scatter plot here as output$scatter
  
  
  # put boxplot here as output$boxplot
  
  
})