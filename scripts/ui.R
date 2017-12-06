#load and install libraries needed
library(shiny)
library(rsconnect)
install.packages("shinythemes")

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
    tabPanel("Median Salary", 
      sidebarLayout(
        sidebarPanel(
          checkboxGroupInput("Major_category", 
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
