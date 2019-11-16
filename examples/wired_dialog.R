if (interactive()) {
  library(shiny)
  library(wired)

  ui <- fluidPage(
    tags$h2("Wired modal"),
    wired_button("show", "Show modal window"),
    wired_dialog(
      tags$div(
        style = "position: absolute; top: 5px; right: 5px;",
        wired_icon_button("close2", icon("times"))
      ),
      plotOutput("plot"),
      wired_slider("slider", "Value:"),
      id = "mydialog", labelClose = NULL
    ),
    wired_button("show2", "Show second modal window"),
  )

  server <- function(input, output, session) {

    observeEvent(input$show, {
      wired:::show_wired_dialog(
        wired:::wired_dialog(
          tags$h3("Here's a modal!"),
          tags$p(
            "Lorem ipsum dolor sit amet,",
            "consectetur adipiscing elit",
            "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            "Ut enim ad minim veniam,",
            "quis nostrud exercitation ullamco laboris nisi ut aliquip,",
            " ex ea commodo consequat.",
            "Duis aute irure dolor in reprehenderit in voluptate velit,",
            " esse cillum dolore eu fugiat nulla pariatur."
          )
        )
      )
    })

    observeEvent(input$show2, {
      open_wired_dialog("mydialog")
    })
    observeEvent(input$close2, {
      close_wired_dialog("mydialog")
    })

    output$plot <- renderPlot({
      plot(density(rnorm(input$slider)))
    })

  }

  shinyApp(ui, server)
}

