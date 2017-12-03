library(shiny)
library(rsconnect)


<<<<<<< HEAD
# Show a tabset that includes a summary and 2 plots.
=======
# Show a tabset that includes a plot, summary, and
# table view of the generated distribution
>>>>>>> 043f2c5907d3211a0fd736b16f0ed8877c735d12
shinyUI(fluidPage(
  navbarPage("stats!",
    tabPanel("Summary", 
      mainPanel(
        includeMarkdown("README.md")
      ),
    tabPanel("Salary by Major",
      sidebarLayout(
        sidebarPanel(
          radioButtons("Major_category", "Select major category:",
                       c(data$Major_category))
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
<<<<<<< HEAD
)
=======
)
>>>>>>> 043f2c5907d3211a0fd736b16f0ed8877c735d12
