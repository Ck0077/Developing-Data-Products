#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
        
        titlePanel("Choose a car that suits your needs"),
        
        sidebarLayout(
                sidebarPanel(
                        helpText("Provide information about your needs and the characteristics of the car that you want"),
                        numericInput('dis', 'Distance (in miles):', 50, min = 1, max = 1000),
                        numericInput('cost', 'Gasoline Price (per gallon):', 2.41, min = 2, max = 4, step=0.01),
                        numericInput('gas', 'Maximum expenditure on gasoline:', 50, min=1, max=1000),
                        checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8))
                ),
                mainPanel(
                        dataTableOutput('table')
                )
        )
))