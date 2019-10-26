if (interactive()) {

  library(shiny)
  library(wired)

  ui <- fluidPage(
    wired_slider(
      inputId = "sldr",
      label = "Slider:",
      min = 50,
      max = 600,
      value = 300,
      step = 10,
      radius = 10
    ),
    verbatimTextOutput(outputId = "res")
  )

  server <- function(input, output, session) {

    output$res <- renderPrint(input$sldr)

  }

  shinyApp(ui, server)

}
