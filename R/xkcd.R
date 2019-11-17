
#' @title xkcd charts
#'
#' @description Htmlwidget for Chart.xkcd (\url{https://timqian.com/chart.xkcd})
#'  to create "sketchy", "cartoony" or "hand-drawn" styled charts.
#'
#' @param x,y Values to use on x-axis / y-axis, can be a \code{character}
#'  or a \code{formula} (\code{data} must be provided), or a \code{vector}.
#' @param data An object of type \code{data.frame}, or something than
#'  be converted with \code{as.data.frame}.
#' @param group A grouping variable, same specification than \code{x} or \code{y}.
#' @param type Type of chart : line, scatter, bar, pie or radar.
#'
#' @return an htmlwidget object.
#' @export
#'
#' @example examples/xkcd.R
xkcd <- function(x, y, data = NULL, group = NULL, type = "line") {
  if (!is.null(data))
    data <- as.data.frame(data)
  x <- get_var(x, data)
  lab_y <- deparse(substitute(y))
  y <- get_var(y, data)
  group <- get_var(group, data)
  if (is.null(group))
    group <- rep_len(lab_y, length(y))
  if (identical(type, "scatter")) {
    datasets <- split(x = data.frame(x, y), f = group)
    datasets <- mapply(
      FUN = function(data, label) {
        list(
          label = label,
          data = unname(
            apply(X = data, MARGIN = 1, FUN = as.list)
          )
        )
      },
      datasets,
      names(datasets),
      SIMPLIFY = FALSE,
      USE.NAMES = FALSE
    )
  } else {
    datasets <- split(x = y, f = group)
    datasets <- mapply(
      FUN = function(data, label) {
        list(
          label = label,
          data = data
        )
      },
      datasets,
      names(datasets),
      SIMPLIFY = FALSE,
      USE.NAMES = FALSE
    )
  }
  config_data <- list(
    labels = if (type %in% c("radar", "bar")) {
      unique(as.character(x))
    } else if (type %in% "scatter") {
      NULL
    } else {
      as.character(x)
    },
    datasets = datasets
  )
  xkcd_chart(
    config = list(
      data = dropNulls(config_data),
      options = list(
        dataColors = c("red", "blue", "green", "yellow")
      )
    ),
    type = type
  )
}


#' @importFrom stats model.frame
get_var <- function(x, data = NULL) {
  if (is.null(x))
    return(x)
  if (inherits(x, "character")) {
    if (is.null(data))
      stop("If x or y are specified as character, data must be provided")
    var <- data[[x]]
  } else if (inherits(x, "formula")) {
    if (is.null(data))
      stop("If x or y are specified as formula, data must be provided")
    var <- model.frame(formula = x, data = data)
    var <- var[[1]]
  } else if (is.vector(x)) {
    var <- x
  } else {
    stop("xkcd: x, y or group must be either a character, a formula or a vector.")
  }
  return(var)
}

dropNulls <- function(x) {
  x[!vapply(x, is.null, FUN.VALUE = logical(1))]
}
