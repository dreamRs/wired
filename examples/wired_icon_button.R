if (interactive()) {

  library(shiny)
  library(wired)

  ui <- fluidPage(
    wired_icon_button(
      inputId = "go",
      icon = icon("close")
    ),
    tags$br(),
    verbatimTextOutput(outputId = "res")
  )

  server <- function(input, output, session) {

    output$res <- renderPrint(input$go)

  }

  shinyApp(ui, server)

}
