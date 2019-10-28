
#' Convert to a Wired HTML document
#'
#' @param ... Params
#'
#' @return R Markdown output format to pass to render.
#' @export
#'
#' @importFrom rmarkdown html_document
#'
#' @examples
#' # todo
wired_document <- function(...) {
  html_document(..., extra_dependencies = list(wired_deps()))
}

#' Wired plot hooks for HTML document
#'
#' @param x Filename for the plot (a character string).
#' @param options A list of the current chunk options.
#'
#' @return A character string of code, with plot filenames wrapped.
#' @export
#'
#' @importFrom htmltools tags
#' @importFrom rmarkdown metadata
#' @importFrom knitr image_uri hook_plot_html
#'
#' @examples
#' # todo
hook_plot_wired <- function(x, options) {
  if (isTRUE(options$wired)) {
    cap  <- options$fig.cap  # figure caption
    self_contained <- rmarkdown::metadata$output[[1]]$self_contained
    if (is.null(self_contained))
      self_contained <- TRUE # default
    if (isTRUE(self_contained)) {
      x <- knitr::image_uri(x)
    }
    as.character(tags$div(
      wired_image(src = x, alt = cap),
      tags$figcaption(cap)
    ))
  } else {
    knitr::hook_plot_html(x, options)
  }
}

