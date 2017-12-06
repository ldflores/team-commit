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
              plotOutput("box")
            )
         )
       )
   )
)
)
