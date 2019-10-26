if (interactive()) {

  library(shiny)
  library(wired)

  ui <- fluidPage(
    wired_search(
      inputId = "srch",
      label = "Text (Enter to update):",
      placeholder = "Write something!"
    ),
    verbatimTextOutput(outputId = "res")
  )

  server <- function(input, output, session) {

    output$res <- renderPrint(input$srch)

  }

  shinyApp(ui, server)

}
