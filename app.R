library(shiny)

ui <- fluidPage(
    titlePanel("Let's Do Arithmetic!"),
    sidebarLayout(
        sidebarPanel(
            numericInput(inputId = "number1",
                         label = "Number 1",
                         value = 0),
            numericInput(inputId = "number2",
                         label = "Number 2",
                         value = 0)
        ),
        mainPanel(
            h2("The sum of the two numbers is:"),
            textOutput("sum")
        )
    )
)

server <- function(input, output) {
    output$sum <- renderText({
        x1 <- as.numeric(input$number1)
        x2 <- as.numeric(input$number2)
        x1 + x2
    })
}

shinyApp(ui = ui, server = server)


