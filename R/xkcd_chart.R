
#' @title Raw API to use chart.xkcd JavaScript library
#'
#' @param config A \code{list} of parameter to define chart options.
#' @param type Type of chart : line, scatter, bar, pie or radar.
#' @param width A numeric input in pixels.
#' @param height A numeric input in pixels.
#' @param elementId Use an explicit element ID for the widget.
#'
#' @importFrom htmlwidgets createWidget sizingPolicy
#'
#' @export
#'
#' @example examples/xkcd_chart.R
xkcd_chart <- function(config, type = c("line", "scatter", "bar", "pie", "radar"),
                       width = NULL, height = NULL, elementId = NULL) {

  type <- match.arg(type)
  type <- switch(
    type,
    "line" = "Line",
    "scatter" = "XY",
    "bar" = "Bar",
    "pie" = "Pie",
    "radar" = "Radar"
  )

  x <- list(
    type = type,
    config = config
  )

  createWidget(
    name = "xkcd_chart",
    x = x,
    width = width,
    height = height,
    package = "wired",
    elementId = elementId,
    sizingPolicy = sizingPolicy(
      defaultWidth = "100%",
      defaultHeight = "100%",
      viewer.defaultHeight = "100%",
      viewer.defaultWidth = "100%",
      viewer.fill = TRUE,
      browser.defaultHeight = "100%",
      browser.defaultWidth = "100%",
      knitr.defaultHeight = "320px",
      knitr.figure = FALSE,
      browser.fill = TRUE,
      padding = 10
    )
  )
}

#' @importFrom htmltools tag
xkcd_chart_html <- function(id, style, class, ...) {
  tag("svg", list(id = id, style = style, class = class, ...))
}

#' Shiny bindings for xkcd
#'
#' Output and render functions for using xkcd within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a xkcd
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name xkcd-shiny
#'
#' @importFrom htmlwidgets shinyWidgetOutput shinyRenderWidget
#'
#' @export
xkcdOutput <- function(outputId, width = "100%", height = "400px"){
  htmlwidgets::shinyWidgetOutput(outputId, "xkcd", width, height, package = "wired")
}

#' @rdname xkcd-shiny
#' @export
renderXkcd <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, xkcdOutput, env, quoted = TRUE)
}
