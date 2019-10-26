if (interactive()) {

  library(shiny)
  library(wired)

  ui <- fluidPage(
    wired_select(
      inputId = "slct",
      label = "Select",
      choices = c("normal",
                  "uniform",
                  "exponential"),
      selected = "normal"
    ),
    verbatimTextOutput(outputId = "res")
  )

  server <- function(input, output, session) {

    output$res <- renderPrint(input$slct)

  }

  shinyApp(ui, server)

}

