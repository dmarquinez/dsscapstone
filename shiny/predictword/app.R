#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(sbo)

ui <- fluidPage(

    titlePanel("Next Word Predictor"),

    sidebarLayout(
        sidebarPanel(
            textInput("mytext", "Enter text to predict next word","write here")
            ),
        mainPanel(
            h4("Predicted word is:"),
            textOutput("output")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    load("../../pred.rda")
    predictor <- sbo_predictor(predt)
    output$output <- renderText({
        p <- predict(predictor,input$mytext)
        out <- p[1]
        if(out=="<EOS>")
            out <- p[2]
        return(out)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
