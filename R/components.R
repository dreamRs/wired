
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
#'
#'
#' }
#'
#' }
wired_card <- function(..., elevation = 2, padding = 10, width = NULL) {
  if (elevation < 1 | elevation > 5)
    stop("Elevation must be between 1-5 (inclusive).", call. = FALSE)
  tag <- tagw$card(
    style = if (!is.null(width)) paste0("width: ", validateCssUnit(width), ";"),
    style = paste0("padding: ", validateCssUnit(padding), ";"),
    ..., elevation = elevation
  )
  wired_dependencies(tag)
}

