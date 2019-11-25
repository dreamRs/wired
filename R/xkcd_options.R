
#' Set options for an xkcd chart
#'
#' @param xkcd An \code{xkcd} htmlwidgets objet.
#' @param dataColors Array of colors for different datasets.
#' @param showLine (scatter) Connect the points with lines (default: false).
#' @param timeFormat (scatter) specify the time format if the x values are time (default undefined)
#'  chart.xkcd use dayjs to format time, you can find the all the available formats
#'  \href{https://github.com/iamkun/dayjs/blob/dev/docs/en/API-reference.md#list-of-all-available-formats}{here}.
#' @param showLegend (radar) Display legend near chart (default false)
#' @param dotSize (scatter, radar) You can change size of the dots if you want (default 1).
#' @param xTickCount (scatter) Customize tick numbers you want to see on the x axis (default 3)
#' @param yTickCount (scatter, line, bar) Customize tick numbers you want to see on the y axis (default 3)
#' @param ticksCount (radar) Customize tick numbers you want to see on the main line (default 3).
#' @param innerRadius (radar) Specify empty pie chart radius (default: 0.5), want a pie chart? set innerRadius to 0.
#' @param showLabels (radar) Display labels near every line (default false)
#' @param fontFamily Customize font family used in the chart
#' @param unxkcdify Disable xkcd effect (default false)
#' @param strokeColor Stroke colors (default black).
#' @param backgroundColor Color for BG (default white).
#'
#' @return an \code{\link{xkcd}} htmlwidget object.
#' @export
#'
#' @example examples/xkcd_options.R
xkcd_options <- function(xkcd,
                         dataColors = NULL,
                         showLine = NULL,
                         timeFormat = NULL,
                         showLegend = NULL,
                         dotSize = NULL,
                         xTickCount = NULL,
                         yTickCount = NULL,
                         ticksCount = NULL,
                         innerRadius = NULL,
                         showLabels = NULL,
                         fontFamily = NULL,
                         unxkcdify = NULL,
                         strokeColor = NULL,
                         backgroundColor = NULL) {
  if (!inherits(xkcd, "xkcd_chart"))
    stop("\'xkcd\' must be a xkcd htmlwidget object.")
  xkcd$x$config$options <- modifyList(
    x = xkcd$x$config$options,
    val = dropNulls(list(
      dataColors = list1(dataColors),
      showLine = showLine,
      timeFormat = timeFormat,
      dotSize = dotSize,
      xTickCount = xTickCount,
      yTickCount = yTickCount,
      innerRadius = innerRadius,
      showLabels = showLabels,
      fontFamily = fontFamily,
      unxkcdify = unxkcdify,
      strokeColor = strokeColor,
      backgroundColor = backgroundColor
    ))
  )
  xkcd
}


list1 <- function(x) {
  if (length(x) == 1) {
    list(x)
  } else {
    x
  }
}
