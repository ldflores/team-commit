library(shiny)
library(rsconnect)

get_Major_Cat <- unique(c(selected$Major_category))
# Show a tabset that includes a plot, summary, and
# table view of the generated distribution
shinyUI(fluidPage(
  navbarPage("Stats!",

             tabPanel("Summary", 
                      mainPanel(
                        includeMarkdown("README.md")
                      )
             ),
             tabPanel("Salary by Major",
                      sidebarLayout(
                        sidebarPanel(
                          radioButtons("Major_category", "Select major category:",
                                       get_Major_Cat)
                        ),
                        mainPanel(
                          plotOutput("scatter")
                        )
                      )
             ),
             tabPanel("Average Salary", 
                      sidebarLayout(
                        sidebarPanel(
                          #placeholder
                        ),
                        mainPanel(
                          plotOutput("plot")
                        )
                      )
             )
  )
)
)


