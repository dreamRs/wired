if (interactive()) {

  library(shiny)
  library(wired)

  ui <- fluidPage(
    wired_text(
      inputId = "txt",
      label = "Text:",
      placeholder = "Write something!"
    ),
    verbatimTextOutput(outputId = "res")
  )

  server <- function(input, output, session) {

    output$res <- renderPrint(input$txt)

  }

  shinyApp(ui, server)

}
