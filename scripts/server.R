#load libraries
library(dplyr)
library(ggplot2)

# get data into dataframe

get_data <- read.csv('all-ages.csv', stringsAsFactors = FALSE, header = TRUE)

# compute salary variability column to be used in graph
selected <- get_data %>% mutate(salary_variability = P75th - P25th)
get_Major_Cat <- unique(c(selected$Major_category))


shinyServer(function(input, output) {
  # make a scatter plot that compares salaries across categories of majors, weighs size based on number of students
  # in the selected major(s)
  output$scatter <- renderPlot({
    filtered <- selected %>% filter(Major_category == input$Major_category)
    ggplot(filtered, aes(x = salary_variability, y = Median, color = Major_category, size = Total)) + 
      labs(x = 'Salary Variability', y = 'Median Salary', color = 'Category of Major') +
      ggtitle("Variablity in Salaries by College Majors") +
      scale_size_area(max_size = 20) +
      geom_point(alpha = 0.6) +
      theme_bw() +
      theme()
  })
  
  # make a boxplot that chooses a category in a major, and graphs either single or side by side boxplot depending on input
  output$box <- renderPlot({
    choose <- selected %>% filter(Major_category == input$Major_cat)
    g <- ggplot(choose, aes(x = Major_category, y = Median, color = Major_category)) +
      geom_boxplot()
    g + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
      ggtitle("Boxplot of Range of Salaries \nfor Different Majors") +
      xlab("Major Category") +
      ylab("Salary Range")
  })
  #make a scatter plot of unemployment rate
  output$scatter2 <- renderPlot({
    filtered <- selected %>% filter(Major_category == input$Major_ct)
    ggplot(filtered, aes(x = Major, y = Unemployment_rate, color = Major_category, size = Total)) +
      labs(x = "Majors", y = "Unemployment Rate", color = "Category of Major") +
      theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
      ggtitle("Unemployment Rates of Different Majors") +
      scale_size_area(max_size = 10) +
      geom_point(alpha = 0.6)
    
  })
})