
#' Convert to an Wired HTML document
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
#' @noRd
#'
#' @examples
#' # todo
hook_plot_wired <- function(x, options, ...) {
  fig.num = options$fig.num = options$fig.num %n% 1L
  fig.cur = options$fig.cur %n% 1L
  if (options$fig.show == "animate") {
    return(if (fig.cur < fig.num) "" else hook_animation(options)(x, options))
  }
  ai = options$fig.show == "asis"
  plot1 = ai || fig.cur <= 1L
  plot2 = ai || fig.cur == fig.num
  d1 = if (plot1)
    paste0(if (out_format("html"))
      "</div>", sprintf("<div class=\"rimage %s\">",
                        options$fig.align))
  d2 = if (plot2)
    paste0("</div>", if (out_format("html"))
      "<div class=\"rcode\">")
  # .upload.url <- knitr::opts_knit$get("upload.fun")
  paste0(d1, wired.img.tag(
    .upload.url(x), options$out.width, options$out.height,
    .img.cap(options), paste(c(options$out.extra, "class=\"plot\""),
                             collapse = " ")
  ), d2, "\n")
}

out_format <- function(x) {
  fmt = knitr::opts_knit$get("out.format")
  if (missing(x))
    fmt
  else !is.null(fmt) && (fmt %in% x)
}

`%n%` <- function(x, y)
  if (is.null(x)) y else x

.upload.url <- function(x) {
  if (knitr::opts_knit$get("self.contained")) {
    knitr::image_uri(x)
  } else {
    (knitr::opts_knit$get("upload.fun"))(x)
  }
}

wired.img.tag <- function(src, w, h, caption, extra) {
  caption = if (length(caption) == 1 && caption != "") {
    paste0("title=\"", caption, "\" alt=\"",
           caption, "\" ")
  }
  tag = if (grepl("[.]pdf$", src, ignore.case = TRUE)) {
    extra = c(extra, "type=\"application/pdf\"")
    "embed"
  } else {
    "wired-image"
  }
  paste0("<", tag, " src=\"", knitr::opts_knit$get("base.url"),
         src, "\" ", caption, .img.attr(w, h, extra), " />")
}

.img.attr <- function(w, h, extra) {
  paste(c(sprintf("width=\"%s\"", w), sprintf("height=\"%s\"",
                                              h), extra), collapse = " ")
}

.img.cap <- function (options, alt = FALSE) {
  cap = options$fig.cap %n% {
    if (is.null(pandoc_to()))
      sprintf("plot of chunk %s", options$label)
    else ""
  }
  if (length(cap) == 0)
    cap = ""
  if (is_blank(cap))
    return(cap)
  if (alt)
    return(escape_html(cap))
  paste0(create_label(options$fig.lp, options$label, if (options$fig.num >
                                                         1L && options$fig.show == "asis")
    options$fig.cur), cap)
}

pandoc_to <- function(x) {
  fmt = knitr::opts_knit$get("rmarkdown.pandoc.to")
  if (missing(x))
    fmt
  else !is.null(fmt) && (fmt %in% x)
}


hook_animation <- function(options) {
  if (is.function(fun <- options$animation.hook))
    return(fun)
  if (is.character(fun))
    return(switch(fun, ffmpeg = knitr::hook_ffmpeg_html, gifski = knitr::hook_gifski,
                  scianimator = knitr::hook_scianimator, r2swf = knitr::hook_r2swf,
                  stop("Invalid value for the chunk option animation.hook: ",
                        fun)))
  if (is.function(fun <- knitr::opts_knit$get("animation.fun")))
    return(fun)
  knitr::hook_ffmpeg_html
}


is_blank <- function(x) {
  if (length(x))
    all(grepl("^\\s*$", x))
  else TRUE
}

escape_html <- function(x) {
  x = gsub("&", "&amp;", x)
  x = gsub("<", "&lt;", x)
  x = gsub(">", "&gt;", x)
  x = gsub("\"", "&quot;", x)
  x
}


create_label <- function(..., latex = FALSE) {
  if (isTRUE(knitr::opts_knit$get("bookdown.internal.label"))) {
    lab1 = "(\\#"
    lab2 = ")"
  }
  else if (latex) {
    lab1 = "\\label{"
    lab2 = "}"
  }
  else {
    return("")
  }
  paste0(lab1, ..., lab2)
}

