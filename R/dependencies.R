
#' @importFrom htmltools htmlDependency attachDependencies
wired_dependencies <- function(tag) {
  version <- as.character(packageVersion("wired")[[1]])
  font <- getOption(x = "GloriaHallelujah", default = TRUE)
  if (isTRUE(font)) {
    stylesheet <- "styles.css"
  } else {
    stylesheet <- NULL
  }
  dep <- htmlDependency(
    name = "wired", version = version,
    src = c(href = "wired"),
    script = c(
      "wired-elements.bundled.min.js",
      "wired-bindings.js"
    ),
    stylesheet = stylesheet
  )
  attachDependencies(tag, dep, append = TRUE)
}
