if (interactive()) {

  library(shiny)
  library(wired)

  ui <- fluidPage(
    wired_radio(
      inputId = "radi", label = "Radio buttons:",
      choices = c("Normal" = "norm",
                  "Uniform" = "unif",
                  "Log-normal" = "lnorm",
                  "Exponential" = "exp")
    ),
    verbatimTextOutput(outputId = "res")
  )

  server <- function(input, output, session) {

    output$res <- renderPrint(input$radi)

  }

  shinyApp(ui, server)

}
