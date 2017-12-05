library(shiny)
library(rsconnect)

get_Major_Cat <- unique(c(selected$Major_category))
# Show a tabset that includes a plot, summary, and
# table view of the generated distribution
shinyUI(fluidPage(
  navbarPage("Stats!",
<<<<<<< HEAD
    tabPanel("Summary", 
      mainPanel(
        includeMarkdown("README.md")
      )
    ),
    tabPanel("Salary by Major",
      sidebarLayout(
        sidebarPanel(
          checkboxGroupInput("Major_category", "Select Major Category:", get_Major_Cat) 
          #I don't know how to select one to start
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
=======

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
>>>>>>> 976ee3c8d74fe4f5f7282cd3d7284d45bd051a7c
  )
)
)


