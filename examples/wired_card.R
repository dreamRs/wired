library(htmltools)
browsable(tagList(
  wired_card(
    "A sketchy card !"
  ),
  tags$br(),
  "Another with fill background:",
  wired_card(
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    " Vestibulum imperdiet, erat a porttitor sagittis,",
    " eros mauris finibus diam, porta venenatis enim leo ut libero.",
    " Morbi volutpat nibh ex, quis faucibus ante dictum vestibulum.",
    " Etiam cursus turpis in lorem rutrum, vitae imperdiet sem mollis.",
    " Mauris quis neque ac elit suscipit posuere.",
    fill = "red", width = "100%"
  )
))

if (interactive()) {

  library(shiny)
  library(wired)

  ui <- fluidPage(
    fluidRow(
      column(
        width = 4,
        wired_card("Simple card")
      ),
      column(
        width = 4,
        wired_card(
          "Another one with a plot!",
          plotOutput(outputId = "plot"),
          elevation = 5, width = "100%"
        )
      )
    )
  )

  server <- function(input, output, session) {

    output$plot <- renderPlot({
      plot(sin(seq(-pi, pi, length.out = 100)), type = "l")
    })

  }

  shinyApp(ui, server)
}
