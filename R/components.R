
#' Wired Card
#'
#' @param ... UI objects to be contained in the card.
#' @param elevation Numerical number between 1-5 (inclusive) - sets the elevation of the card. Default is 2.
#' @param padding Amount of padding to apply. Can be numeric (in pixels) or character (e.g. "3em").
#' @param width The width of the input, e.g. \code{400px}, or \code{100\%}; see \link[htmltools]{validateCssUnit}.
#'
#' @export
#'
#' @examples
#' \dontrun{
#'
#' if (interactive()) {
#'
#' library(shiny)
#' library(wired)
#'
#' ui <- fluidPage(
#'   fluidRow(
#'     column(
#'       width = 4,
#'       wired_card("Simple card")
#'     ),
#'     column(
#'       width = 4,
#'       wired_card(
#'         "Another one with a plot!",
#'         plotOutput(outputId = "plot"),
#'         elevation = 5, width = "100%"
#'       )
#'     )
#'   )
#' )
#'
#' server <- function(input, output, session) {
#'
#'   output$plot <- renderPlot({
#'     plot(sin(seq(-pi, pi, length.out = 100)), type = "l")
#'   })
#'
#' }
#'
#' shinyApp(ui, server)
#'
#' }
#'
#' }
wired_card <- function(..., elevation = 2, padding = 10, width = NULL) {
  if (elevation < 1 | elevation > 5)
    stop("Elevation must be between 1-5 (inclusive).", call. = FALSE)
  tag <- wired_tag$card(
    style = if (!is.null(width)) paste0("width: ", validateCssUnit(width), ";"),
    style = paste0("padding: ", validateCssUnit(padding), ";"),
    ..., elevation = elevation
  )
  wired_dependencies(tag)
}




#' @title Wired Tooltip
#'
#' @description Tooltip with text that appears on hover over an element.
#'
#' @param id Id of the element the tooltip is for.
#' @param text Text in the tooltip.
#' @param position Postion where tolltip will appear.
#'
#' @export
#'
#' @examples
#' \dontrun{
#'
#' if (interactive()) {
#'
#' library(shiny)
#' library(wired)
#'
#' ui <- fluidPage(
#'   fluidRow(
#'     column(
#'       width = 4,
#'       wired_slider(
#'         inputId = "n",
#'         label = "Number of obs. :",
#'         min = 50, value = 100, max = 300,
#'         radius = 10
#'       ),
#'       wired_tooltip(
#'         id = "n",
#'         text = "This is a slider !",
#'         position = "right"
#'       )
#'     ),
#'     column(
#'       width = 8,
#'       plotOutput("plot"),
#'       wired_tooltip(
#'         id = "plot",
#'         text = "And a plot !",
#'         position = "bottom"
#'       )
#'     )
#'   )
#' )
#'
#' server <- function(input, output, session) {
#'
#'   output$plot <- renderPlot({
#'     plot(sin(seq(from = pi, by = 0.05, length.out = input$n)))
#'   })
#'
#' }
#'
#' shinyApp(ui, server)
#'
#' }
#'
#' }
wired_tooltip <- function(id, text, position = c("left", "right", "top", "bottom")) {
  position <- match.arg(position)
  tag <- wired_tag$tooltip(
    `for` = id, position = position, text = text
  )
  wired_dependencies(tag)
}





#' Wired Image
#'
#' @param src URL / path of the image.
#' @param elevation Numerical number between 1-5 (inclusive) -
#'  sets the elevation of the card. Default is 1.
#' @param ... Named attributes to be applied to the image.
#'
#' @return an HTML tag
#' @export
#'
#' @example examples/wired_image.R
wired_image <- function(src, elevation = 1, ...) {
  wired_dependencies(
    wired_tag$image(src = src, elevation = elevation, ...)
  )
}



