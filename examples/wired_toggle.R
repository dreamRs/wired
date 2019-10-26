if (interactive()) {

  library(shiny)
  library(wired)

  ui <- fluidPage(
    wired_toggle(
      inputId = "tggl",
      label = "Toggle:"
    ),
    verbatimTextOutput(outputId = "res")
  )

  server <- function(input, output, session) {

    output$res <- renderPrint(input$tggl)

  }

  shinyApp(ui, server)

}
