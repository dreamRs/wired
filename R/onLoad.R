#' Adds the content of www to wired/
#'
#' @importFrom shiny addResourcePath
#' @importFrom utils packageVersion
#'
#' @noRd
.onLoad <- function(...) {
  shiny::addResourcePath('wired', system.file('www', package = 'wired'))
}
