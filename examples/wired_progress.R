
wired_progress("ID", value = 50)

wired_progress("ID", value = 150, max = 200, percentage = FALSE)


if (interactive()) {
  library(shiny)
  library(wired)

  ui <- fluidPage(
    tags$h2("Wired progress bar"),
    wired_progress("progress", value = 10),
    numericInput("update", "Enter new value:", 0)
  )

  server <- function(input, output, session) {

    observe({
      update_wired_progress("progress", input$update)
    })

  }

  shinyApp(ui, server)
}
