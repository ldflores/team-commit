library(dplyr)
library(ggplot2)

setwd('C:/Users/dougd/Desktop/Info_201/team-commit')
data <- read.csv('all-ages.csv', stringsAsFactors = FALSE)

selected <- data %>% mutate(salary_variability = P75th - P25th)

ggplot(selected, aes(x = salary_variability, y = Median, color = Major_category)) +
  geom_point()

choose <- data %>% filter(Major_category == 'Engineering')
ggplot(data, aes(x = Major_category, y = Median)) +
  geom_boxplot()