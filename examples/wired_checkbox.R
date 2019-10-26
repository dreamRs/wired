if (interactive()) {

  library(shiny)
  library(wired)

  ui <- fluidPage(
    wired_checkbox(
      inputId = "chck",
      label = "Single checkbox"
    ),
    verbatimTextOutput(outputId = "res")
  )

  server <- function(input, output, session) {

    output$res <- renderPrint(input$chck)

  }

  shinyApp(ui, server)

}
