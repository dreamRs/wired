
# wired tags ----

#' @importFrom htmltools tag
wired_tag <- list()

wired_tag$button <- function(...) {
 tag("wired-button", list(...))
}
wired_tag$checkbox <- function(...) {
 tag("wired-checkbox", list(...))
}
wired_tag$combo <- function(...) {
 tag("wired-combo", list(...))
}
wired_tag$item <- function(...) {
 tag("wired-item", list(...))
}
wired_tag$slider <- function(...) {
 tag("wired-slider", list(...))
}
wired_tag$radio_group <- function(...) {
 tag("wired-radio-group", list(...))
}
wired_tag$radio <- function(...) {
 tag("wired-radio", list(...))
}
wired_tag$card <- function(...) {
 tag("wired-card", list(...))
}
wired_tag$toggle <- function(...) {
 tag("wired-toggle", list(...))
}
wired_tag$input <- function(...) {
 tag("wired-input", list(...))
}
wired_tag$icon_button <- function(...) {
 tag("wired-icon-button", list(...))
}
wired_tag$tooltip <- function(...) {
 tag("wired-tooltip", list(...))
}
wired_tag$search_input <- function(...) {
 tag("wired-search-input", list(...))
}
wired_tag$image <- function(...) {
  tag("wired-image", list(...))
}
wired_tag$divider <- function(...) {
  tag("wired-divider", list(...))
}

