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
            plotOutput("scatter"),
            p("This graph lets the user view the different median pay and variabilities of one 
              or more major categories. It also shows which majors are larger than others. 
              Information like this lets a student looking into career options gain some valuable
              insight up front and directly from data instead of opinions. A student that cares about
              the variability of salaries as well as the size of their major classes should definitely
              browse this interactive graph!")
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
                looking to pursue education will find this information valuable. ")

            )
         )
       ),
        tabPanel("Employment Rates",
                 sidebarLayout(
                   sidebarPanel(
                     checkboxGroupInput("Major_cat", 
                                        "Select Major Category:", 
                                        get_Major_Cat, 
                                        selected = "Agriculture & Natural Resources")
                   ),
                mainPanel(
                plotOutput("scatter2")
                ) 
           )
       )
    )
)
)
