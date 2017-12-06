#load libraries
library(dplyr)
library(ggplot2)

# get data into dataframe

get_data <- read.csv('all-ages.csv', stringsAsFactors = FALSE, header = TRUE)

# compute salary variability column to be used in graph
selected <- get_data %>% mutate(salary_variability = P75th - P25th)
get_Major_Cat <- unique(c(selected$Major_category))

shinyServer(function(input, output) {
  # make a scatter plot as output$scatter
  output$scatter <- renderPlot({
    filtered <- selected %>% filter(Major_category == input$Major_category)
    ggplot(filtered, aes(x = salary_variability, y = Median, color = Major_category)) + 
      xlab("Salary Variability") + ylab("Median Salary") +
      ggtitle("Variablity in Salaries by College Majors") +
      geom_point()
  })
  
  # make a boxplot as output$boxplot
  output$box <- renderPlot({
    choose <- selected %>% filter(Major_category == input$Major_cat)
    g <- ggplot(choose, aes(x = Major_category, y = Median, color = Major_category)) +
      geom_boxplot()
    g + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
      ggtitle("Boxplot of Range of Salaries \nfor Different Majors") +
      xlab("Major Category") +
      ylab("Salary Range")
  })
})