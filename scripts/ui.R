library(shiny)
library(rsconnect)


# Show a tabset that includes a plot, summary, and
# table view of the generated distribution
shinyUI(fluidPage(
  navbarPage("stats!",
    tabPanel("Summary", 
      mainPanel(
        includeMarkdown("README.md")
      ),
    tabPanel("Salary by Major",
      sidebarLayout(
        sidebarPanel(
          radioButtons("dist", "Select major category:",
                       c(majors$Major_category))
        )
      ),
      mainPanel(
        plotOutput("scatter")
      ),
    tabPanel("Average Salary", 
      sidebarLayout(
        sidebarPanel(
                                              
        )
      ),
      mainPanel(
        plotOutput("plot")
      )
     )
    )
   )
  )
 )
)
