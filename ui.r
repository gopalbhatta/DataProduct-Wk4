
library(markdown)

shinyUI(pageWithSidebar(
  headerPanel("Selection"),
  
  sidebarPanel(
    helpText("Information Required"),
    numericInput('dis', 'Distance (in miles):', 50, min = 1, max = 1000,step = 5),
    numericInput('cost', 'Gasoline Price (per gallon):', 2.41, min = 2, max = 4, step=0.1),
    numericInput('gas', 'Maximum expenditure on gasoline:', 50, min=1, max=1000, step = 5),
    checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
    checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1))
  ),
  
  mainPanel(dataTableOutput('Details'))
)
)