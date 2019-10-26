
#' @importFrom htmltools htmlDependency attachDependencies
wired_dependencies <- function(tag) {
  font <- getOption(x = "GloriaHallelujah", default = TRUE)
  if (isTRUE(font)) {
    stylesheet <- "styles.css"
  } else {
    stylesheet <- NULL
  }
  dep <- htmlDependency(
    name = "wired",
    version = "1.0.0",
    src = c(href = "assets/wired"),
    package = "wired",
    script = c(
      "wired-elements.bundled.min.js",
      "wired-bindings.js"
    ),
    stylesheet = stylesheet
  )
  attachDependencies(tag, dep, append = TRUE)
}
