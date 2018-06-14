
# wired tags ----

#' @importFrom htmltools tag tags
tagw <- list()

tagw$button <- function(...) {
  htmltools::tag("wired-button", list(...))
}
tagw$checkbox <- function(...) {
  htmltools::tag("wired-checkbox", list(...))
}
tagw$combo <- function(...) {
  htmltools::tag("wired-combo", list(...))
}
tagw$item <- function(...) {
  htmltools::tag("wired-item", list(...))
}
tagw$slider <- function(...) {
  htmltools::tag("wired-slider", list(...))
}
tagw$radio_group <- function(...) {
  htmltools::tag("wired-radio-group", list(...))
}
tagw$radio <- function(...) {
  htmltools::tag("wired-radio", list(...))
}
tagw$card <- function(...) {
  htmltools::tag("wired-card", list(...))
}
tagw$toggle <- function(...) {
  htmltools::tag("wired-toggle", list(...))
}
tagw$input <- function(...) {
  htmltools::tag("wired-input", list(...))
}
