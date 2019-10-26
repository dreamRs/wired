
#' Wired Action Button
#'
#' @param inputId The \code{input} slot that will be used to access the value.
#'  The \code{input} slot that will be used to access the value.
#' @param label The contents of the button or link–usually a text label.
#' @param icon An optional icon to appear on the button.
#' @param elevation Number between 1 and 5 (inclusive) that gives
#'  the button a sketchy height. Default value is 1.
#' @param width The width of the input, e.g. \code{400px}, or
#'  \code{100\%}; see \link[htmltools]{validateCssUnit}.
#' @param ... Named attributes to be applied to the button.
#'
#' @export
#'
#' @importFrom htmltools validateCssUnit
#'
#' @example examples/wired_button.R
wired_button <- function(inputId, label = NULL, icon = NULL, elevation = 1, width = NULL, ...) {
  tag <- wired_tag$button(
    id = inputId, class = "action-button",
    elevation = elevation,
    style = if (!is.null(width)) paste0("width: ", validateCssUnit(width), ";"),
    list(icon, label), ...
  )
  wired_dependencies(tag)
}



#' Wired Icon Button
#'
#' @param inputId The \code{input} slot that will be used to access the value. The \code{input} slot that will be used to access the value.
#' @param icon An \code{\link[shiny:icon]{shiny::icon}} to appear on the button.
#' @param ... Named attributes to be applied to the button.
#'
#' @export
#'
#' @example examples/wired_icon_button.R
wired_icon_button <- function(inputId, icon, ...) {
  tag <- wired_tag$icon_button(
    id = inputId, class = "action-button",
    icon, ...
  )
  wired_dependencies(tag)
}



#' Wired Single Checkbox
#'
#' @param inputId The \code{input} slot that will be used to access the value.
#' @param label Display label for the control, or \code{NULL} for no label.
#' @param value Initial value (\code{TRUE} or \code{FALSE}).
#' @param width The width of the input, e.g. \code{400px}, or \code{100\%}; see \link[htmltools]{validateCssUnit}.
#'
#' @export
#'
#' @importFrom htmltools tags validateCssUnit
#'
#' @example examples/wired_checkbox.R
wired_checkbox <- function(inputId, label, value = FALSE, width = NULL) {
  chckTag <- wired_tag$checkbox(label, id = inputId)
  if (value)
    chckTag$attribs$checked <- "checked"
  tag <- tags$div(
    class = "form-group shiny-input-container",
    style = if (!is.null(width)) paste0("width: ", validateCssUnit(width), ";"),
    chckTag
  )
  wired_dependencies(tag)
}



#' Wired Select Box
#'
#' @param inputId The \code{input} slot that will be used to access the value.
#' @param label Display label for the control, or \code{NULL} for no label.
#' @param choices List of values to select from. If elements of the list are named, then that name rather than the value is displayed to the user.
#' @param selected The initially selected value. If not specified then defaults to the first value.
#' @param width The width of the input, e.g. \code{400px}, or \code{100\%}; see \link[htmltools]{validateCssUnit}.
#'
#' @export
#'
#' @importFrom htmltools tags validateCssUnit
#'
#' @example examples/wired_select.R
wired_select <- function(inputId, label, choices, selected = NULL, width = NULL) {
  choices <- choicesWithNames(choices)
  if (is.null(selected)) {
    selected <- firstChoice(choices)
  }
  itemTags <- lapply(
    X = seq_along(choices),
    FUN = function(i) {
      wired_tag$item(
        value = choices[[i]], names(choices)[i], role = "option",
        `aria-selected` = if (choices[[i]] %in% selected) "true"
      )
    }
  )
  selectTag <- wired_tag$combo(itemTags, selected = selected, id = inputId)
  tag <- tags$div(
    class = "form-group shiny-input-container",
    style = if (!is.null(width)) paste0("width: ", validateCssUnit(width), ";"),
    tags$label(label, `for` = inputId), tags$br(), selectTag
  )
  wired_dependencies(tag)
}




#' Wired Slider
#'
#' @param inputId The \code{input} slot that will be used to access the value.
#' @param label Display label for the control, or \code{NULL} for no label.
#' @param value The initial value of the slider.
#' @param min The minimum value (inclusive) that can be selected.
#' @param max The maximum value (inclusive) that can be selected.
#' @param step Specifies the interval between each selectable value on the slider.
#' @param radius Radius of the knob of the slider.
#' @param width The width of the input, e.g. \code{400px}, or \code{100\%}; see \link[htmltools]{validateCssUnit}.
#'
#' @export
#'
#' @importFrom htmltools tags validateCssUnit
#'
#' @example examples/wired_slider.R
wired_slider <- function(inputId, label = NULL, value = 10, min = 0, max = 100, step = 1, radius = 20, width = NULL) {
  tag <- tags$div(
    class = "form-group shiny-input-container",
    style = if (!is.null(width)) paste0("width: ", validateCssUnit(width), ";"),
    tags$label(label, `for` = inputId), tags$br(),
    wired_tag$slider(id=inputId, knobradius=radius, value=value, min=min, max=max, step=step)
  )
  wired_dependencies(tag)
}




#' Wired Radio Buttons
#'
#' @param inputId The \code{input} slot that will be used to access the value.
#' @param label Display label for the control, or \code{NULL} for no label.
#' @param choices List of values to select from. If elements of the list are named, then that name rather than the value is displayed to the user.
#' @param selected The initially selected value. If not specified then defaults to the first value.
#' @param width The width of the input, e.g. \code{400px}, or \code{100\%}; see \link[htmltools]{validateCssUnit}.
#'
#' @export
#'
#' @importFrom htmltools tags validateCssUnit
#'
#' @example examples/wired_radio.R
wired_radio <- function(inputId, label, choices, selected = NULL, width = NULL) {
  choices <- choicesWithNames(choices)
  if (is.null(selected)) {
    selected <- firstChoice(choices)
  }
  radioTags <- lapply(
    X = seq_along(choices),
    FUN = function(i) {
      wired_tag$radio(name = choices[[i]], text = names(choices)[i], names(choices)[i])
    }
  )
  radioGroupTag <- wired_tag$radio_group(radioTags, selected = selected, id = inputId)
  tag <- tags$div(
    class = "form-group shiny-input-container-inline",
    style = if (!is.null(width)) paste0("width: ", validateCssUnit(width), ";"),
    tags$label(label, `for` = inputId), tags$br(), radioGroupTag
  )
  wired_dependencies(tag)
}




#' Wired Toggle
#'
#' @param inputId The \code{input} slot that will be used to access the value.
#' @param label Display label for the control, or \code{NULL} for no label.
#' @param value Initial value (\code{TRUE} or \code{FALSE}).
#' @param width The width of the input, e.g. \code{400px}, or \code{100\%}; see \link[htmltools]{validateCssUnit}.
#'
#' @export
#'
#' @importFrom htmltools tags validateCssUnit
#'
#' @example examples/wired_toggle.R
wired_toggle <- function(inputId, label, value = FALSE, width = NULL) {
  tgglTag <- wired_tag$toggle(id = inputId)
  if (value)
    tgglTag$attribs$checked <- "checked"
  tag <- tags$div(
    class = "form-group shiny-input-container",
    style = if (!is.null(width)) paste0("width: ", validateCssUnit(width), ";"),
    tags$label(label, `for` = inputId), tgglTag
  )
  wired_dependencies(tag)
}



#' Wired Text Input
#'
#' @param inputId The \code{input} slot that will be used to access the value.
#' @param label Display label for the control, or \code{NULL} for no label.
#' @param placeholder A character string giving the user a hint as to what can be entered into the control.
#' @param value Initial value for the input.
#' @param width The width of the input, e.g. \code{400px}, or
#'  \code{100\%}; see \link[htmltools]{validateCssUnit}.
#'
#' @export
#'
#' @importFrom htmltools tags validateCssUnit
#'
#' @example examples/wired_text.R
wired_text <- function(inputId, label = NULL, placeholder = NULL, value = "", width = NULL) {
  txtTag <- wired_tag$input(id = inputId, type = "text", value = value)
  if (!is.null(placeholder))
    txtTag$attribs$placeholder <- placeholder
  if (!is.null(width))
    txtTag$attribs$style <- paste0("width: ", validateCssUnit(width), ";")
  tag <- tags$div(
    class = "form-group shiny-input-container",
    style = if (!is.null(width)) paste0("width: ", validateCssUnit(width), ";"),
    if (!is.null(label)) tags$label(label, `for` = inputId), tags$br(),
    txtTag
  )
  wired_dependencies(tag)
}


#' Wired Search Input
#'
#' @param inputId The \code{input} slot that will be used to access the value.
#' @param label Display label for the control, or \code{NULL} for no label.
#' @param placeholder A character string giving the user a hint as to what can be entered into the control.
#' @param value Initial value for the input.
#' @param width The width of the input, e.g. \code{400px}, or
#'  \code{100\%}; see \link[htmltools]{validateCssUnit}.
#'
#' @export
#'
#' @importFrom htmltools tags validateCssUnit
#'
#' @example examples/wired_search.R
wired_search <- function(inputId, label = NULL, placeholder = NULL, value = "", width = NULL) {
  txtTag <- wired_tag$search_input(id = inputId, value =  value)
  if (!is.null(placeholder))
    txtTag$attribs$placeholder <- placeholder
  if (!is.null(width))
    txtTag$attribs$style <- paste0("width: ", validateCssUnit(width), ";")
  tag <- tags$div(
    class = "form-group shiny-input-container",
    style = if (!is.null(width)) paste0("width: ", validateCssUnit(width), ";"),
    if (!is.null(label)) tags$label(label, `for` = inputId), tags$br(),
    txtTag
  )
  wired_dependencies(tag)
}




