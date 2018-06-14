
#' @importFrom htmltools htmlDependency attachDependencies
wired_dependencies <- function(tag) {
  version <- as.character(packageVersion("wired")[[1]])
  dep <- htmlDependency(
    name = "wired", version = version,
    src = c(href = "wired"),
    script = c(
      "wired-elements.bundled.min.js",
      "wired-bindings.js"
    ),
    stylesheet = "styles.css"
  )
  attachDependencies(tag, dep, append = TRUE)
}
