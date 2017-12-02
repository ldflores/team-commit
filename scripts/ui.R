library(shiny)
library(rsconnect)


# Show a tabset that includes a plot, summary, and
# table view of the generated distribution
my.ui <- fluidPage(
  navbarPage("stats!",
    tabPanel("Summary", 
      mainPanel(
        includemd("README.md")
      ),
    tabPanel("Salary by Major",
      sidebarLayout(
        sidebarPanel(
          radioButtons("dist", "Select major category:",
                       c(majors$Major_category))
        )
      ),
      mainPanel(
        plotOutput("plot")
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
