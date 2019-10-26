
#' @importFrom htmltools attachDependencies
wired_dependencies <- function(tag) {
  attachDependencies(tag, wired_deps(), append = TRUE)
}

#' @importFrom htmltools htmlDependency
wired_deps <- function() {
  font <- getOption(x = "GloriaHallelujah", default = TRUE)
  if (isTRUE(font)) {
    stylesheet <- "wired/styles.css"
  } else {
    stylesheet <- NULL
  }
  htmlDependency(
    name = "wired",
    version = "2.0.0",
    src = c(href = "assets", file = "assets"),
    package = "wired",
    script = c(
      "wired/wired-elements-2.0.0.bundled.js",
      # "showcase.min.js",
      "wired/wired-bindings.js"
    ),
    stylesheet = stylesheet
  )
}

