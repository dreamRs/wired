if (interactive()) {

  library(shiny)
  library(wired)

  ui <- fluidPage(
    wired_button(
      inputId = "button1",
      label = "GO!"
    ),
    tags$br(),
    verbatimTextOutput(outputId = "res1"),
    wired_button(
      inputId = "button2",
      elevation = 5,
      label = "Another button"
    ),
    tags$br(),
    verbatimTextOutput(outputId = "res2")
  )

  server <- function(input, output, session) {

    output$res1 <- renderPrint(input$button1)

    output$res2 <- renderPrint(input$button2)

  }

  shinyApp(ui, server)

}
