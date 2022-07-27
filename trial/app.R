#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        checkboxInput("image_switch", label = "show an image"),
        plotOutput("distPlot")
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    loaded_image <- reactive({
      if(isTruthy(input$image_switch))
        return(magick::logo)
      else 
        return(NULL)
    })
    
    output$distPlot <- renderPlot({
       image_ggplot(req(loaded_image()))
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
