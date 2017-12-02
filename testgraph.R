library(dplyr)
library(ggplot2)

# get data into dataframe
data <- read.csv('all-ages.csv', stringsAsFactors = FALSE)

# compute salary variability column to be used in graph
selected <- data %>% mutate(salary_variability = P75th - P25th)

# Create scatter graph
ggplot(selected, aes(x = salary_variability, y = Median, color = Major_category)) +
  geom_point()

# Create boxplots, these need to be filtered by a Major_category in order to be readable.
choose <- data %>% filter(Major_category == 'Engineering')
ggplot(data, aes(x = Major_category, y = Median)) +
  geom_boxplot()