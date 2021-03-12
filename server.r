
library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {
  
  output$Details <- renderDataTable({
    data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg, 
                      GasolineExpenditure = input$dis/mpg*input$cost,
                      Cylinders = cyl, Transmission = am)
    data <- filter(data, GasolineExpenditure <= input$gas, Cylinders %in% input$cyl, 
                   Transmission %in% input$am)
    data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
    data <- arrange(data, GasolineExpenditure)
    data
  }, options = list(lengthMenu = c(5, 10, 20), pageLength = 10))
})