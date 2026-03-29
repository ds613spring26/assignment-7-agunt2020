# Install and load packages
if (!require("pacman")) install.packages("pacman")

pacman::p_load(shiny, tidyverse)
---------------------------
# Structure of a Shiny App

# Shiny apps are contained in a single script called app.R.
# The script app.R lives in a directory (for example, 
# newdir/) and the app can be run with runApp("newdir").


# app.R has three components:
  
  #a user interface object

  #a server function

  #a call to the shinyApp function

# 1) The user interface (ui) object controls the layout and 
# appearance of your app.

# 2) The server function contains the instructions that your
# computer needs to build your app

# 3) Finally the shinyApp function creates Shiny app objects 
# from an explicit UI/server pair.


# Examples of basic shiny apps

runExample("01_hello")      # a histogram

runExample("04_mpg")        # global variables

runExample("02_text")       # tables and data frames





# Basic Shiny App -----
# To run:
#        Highlight the section of code and press Ctrl + Enter
#                      (or Cmd + Enter on Mac).


ui <- fluidPage(
  
)
server <- function(input, output) {
}
shinyApp(ui, server)



# Create a histogram with slider ----------
# To run:
#        Highlight the section of code and press Ctrl + Enter
#                      (or Cmd + Enter on Mac).



ui <- fluidPage(sliderInput(inputId = "num",
                            label = "Choose a number",
                            value = 25, min = 1, max = 100),
                plotOutput("hist")
)
server <- function(input, output) {
  output$hist <-renderPlot({
    title <- "Random Normal Values"
    hist(rnorm(input$num), main = title)
  })
}
shinyApp(ui = ui, server = server)

ui <- fluidPage(
  titlePanel("Aparajita Reddy Gunturu"), # The title bar
)

ui <- fluidPage(
  titlePanel("Aparajita Reddy Gunturu"), # The title bar
  selectInput( #Made a dropdown menu with plot types histogram and boxplot
    inputId = "plotType",
    label = "Pick a Visual:",
    choices = c("Histogram", "Boxplot")
    ),
  textOutput("Result"), #Output the result
)

# Define the server code
server <- function(input, output) {
  output$Result <- renderText({
    input$plotType
  })
}
