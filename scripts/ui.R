#load and install libraries needed
library(shiny)
library(rsconnect)
library(shinythemes)

get_Major_Cat <- unique(c(selected$Major_category))
# Show a tabset that includes a plot, summary, and
# table view of the generated distribution
shinyUI(fluidPage(
  theme = shinythemes::shinytheme("slate"),
  navbarPage("Stats!",
    tabPanel("Summary", 
      mainPanel(
        includeMarkdown("README.md")
      )
    ),
    # Make a scater plot of salary by major category
    tabPanel("Salary by Major",
      sidebarLayout(
          sidebarPanel(
            checkboxGroupInput("Major_category",
                               "Select Major Category:", 
                                get_Major_Cat, 
                                selected = "Agriculture & Natural Resources") 
                          
          ),
          mainPanel(
            plotOutput("scatter")
           )
          )
        ),
    #Make boxplot that will compare summary statistics for the majors that are selected, divided by category of major.  
    tabPanel("Median Salary", 
          sidebarLayout(
            sidebarPanel(
              checkboxGroupInput("Major_cat", 
                                 "Select Major Category:", 
                                  get_Major_Cat, 
                                  selected = "Agriculture & Natural Resources")
            ),
            mainPanel(
              plotOutput("box"),
              p("This graph shows the range of salaries for different major categories after
                graduation. It is beneficial to compare the median salaries of each major
                category, it gives a better idea of future career salaries. When comparing all
                of the major categories against eachother, the health category has the highest
                median out of all the major categories. A student looking for a high paying salary 
                should look into the health majors. The engineering major category has the
                greatest difference between the highest and the lowest salaries. A student looking 
                to major in a field of engineering should know that it has a high variance in salary.
                The major categories with the lowest median salaries are education majors. A student 
                looking tp pursue education will find this information valuable. ")
            )
         )
       )
   )
)
)
