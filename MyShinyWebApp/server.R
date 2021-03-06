#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
library(dplyr)

# Define server logic to filter Mt cars data as per user input
shinyServer(function(input, output) {
   
        output$table <- renderDataTable({

                data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg, 
                                  GasolineExpenditure = input$dis/mpg*input$cost,
                                  Cylinders = cyl)
                data <- filter(data, GasolineExpenditure <= input$gas, Cylinders %in% input$cyl)
                data <- arrange(data, GasolineExpenditure)
                data
        }, options = list(lengthMenu = c(5, 15, 30), pageLength = 30))

  
})
