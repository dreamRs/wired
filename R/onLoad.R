#' Shiny resource
#'
#' @importFrom shiny addResourcePath
#'
#' @noRd
.onLoad <- function(...) {
  shiny::addResourcePath("assets", system.file("assets", package = "wired"))
}
