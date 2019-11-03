
#' Wired Card
#'
#' @param ... UI objects to be contained in the card.
#' @param elevation Numerical number between 1-5 (inclusive) -
#'  sets the elevation of the card. Default is 2.
#' @param padding Amount of padding to apply. Can be numeric
#'  (in pixels) or character (e.g. "3em").
#' @param fill A color to fill the background of the card in a sketchy format.
#' @param width The width of the input, e.g. \code{400px},
#'  or \code{100\%}; see \link[htmltools]{validateCssUnit}.
#'
#' @export
#'
#' @example examples/wired_card.R
wired_card <- function(..., elevation = 2, fill = NULL, padding = 10, width = NULL) {
  if (elevation < 1 | elevation > 5)
    stop("Elevation must be between 1-5 (inclusive).", call. = FALSE)
  tag <- wired_tag$card(
    style = if (!is.null(width)) paste0("width: ", validateCssUnit(width), ";"),
    style = paste0("padding: ", validateCssUnit(padding), ";"),
    ..., elevation = elevation, fill = fill
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
#' @importFrom htmltools browsable
#'
#' @example examples/wired_image.R
wired_image <- function(src, elevation = 1, ...) {
  wimg <- wired_dependencies(
    wired_tag$image(src = src, elevation = elevation, ...)
  )
  browsable(wimg)
}


#' Wired Divider
#'
#' @param elevation Numerical number between 1-5 (inclusive) -
#'  sets the elevation of the card. Default is 1.
#'
#' @return an HTML tag
#' @export
#'
#' @example examples/wired_divider.R
wired_divider <- function(elevation = 1) {
  wired_dependencies(
    wired_tag$divider(elevation = elevation)
  )
}



#' Wired Progress bar
#'
#' @param id Id for the progress bar.
#' @param value Numeric value of the progress.
#' @param min Minimum value. Default is 0.
#' @param max Maximum value. Default is 100.
#' @param percentage Boolean indicating if the label should show a \% symbol.
#' @param width Width of the progress bar.
#'
#' @return an HTML tag
#' @export
#'
#' @name wired-progress
#'
#' @importFrom htmltools browsable validateCssUnit
#'
#' @example examples/wired_progress.R
wired_progress <- function(id, value, min = 0, max = 100, percentage = TRUE, width = "100%") {
  wprg <- wired_dependencies(
    wired_tag$progress(
      id = id, value = value,
      min = min, max = max,
      percentage = if (isTRUE(percentage)) percentage else NULL,
      style = if (!is.null(width)) sprintf("width:%s;", validateCssUnit(width))
    )
  )
  browsable(wprg)
}

#' @param session Shiny session.
#'
#' @export
#'
#' @rdname wired-progress
#'
#' @importFrom shiny getDefaultReactiveDomain
update_wired_progress <- function(id, value, session = shiny::getDefaultReactiveDomain()) {
  session$sendCustomMessage(
    type = "update-wired-progress",
    message = list(
      id = id,
      value = value
    )
  )
}








