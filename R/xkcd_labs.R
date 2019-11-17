
#' Add labs to a xkcd chart
#'
#' @param xkcd An \code{xkcd} htmlwidgets objet.
#' @param title The text for the title.
#' @param x The text for the x-axis title.
#' @param y The text for the y-axis title.
#'
#' @return an \code{xkcd} htmlwidget object.
#' @export
#'
#' @importFrom utils modifyList
#'
#' @examples
#' xkcd(x = 1:10, y = exp(1:10)) %>%
#'   xkcd_labs(title = "The title of the chart",
#'             x = "X label",
#'             y = "Y label")
xkcd_labs <- function(xkcd, title = NULL, x = NULL, y = NULL) {
  if (!inherits(xkcd, "xkcd_chart"))
    stop("\'xkcd\' must be a xkcd htmlwidget object.")
  xkcd$x$config <- modifyList(
    x = xkcd$x$config,
    val = dropNulls(list(
      title = title,
      xLabel = x,
      yLabel = y
    ))
  )
  xkcd
}
