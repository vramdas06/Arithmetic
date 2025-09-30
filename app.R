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
                         value = 0),
            actionButton(inputId = "abutton",
                         label = "Add"),
            actionButton(inputId = "mbutton",
                         label = "Multiply")
        ),
        mainPanel(
            h2("The sum of the two numbers is:"),
            textOutput("sum"),
            
            h2("The product of the two numbers is:"),
            textOutput("multiply")
        )
    )
)

server <- function(input, output) {
  x1 <- eventReactive(input$abutton, {
    as.numeric(input$number1)
  })
  
  x2 <- eventReactive(input$abutton, {
    as.numeric(input$number2)
  })

    n1 <- eventReactive(input$mbutton, {
      as.numeric(input$number1)
    })
    
    n2 <- eventReactive(input$mbutton, {
      as.numeric(input$number2)
    })
    
    output$sum <- renderText({
      x1() + x2()
    })
    
    output$multiply <- renderText({
      n1() * n2()
      })
    }
shinyApp(ui = ui, server = server)


