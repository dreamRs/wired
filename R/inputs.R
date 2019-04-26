
#' Wired Action Button
#'
#' @param inputId The \code{input} slot that will be used to access the value. The \code{input} slot that will be used to access the value.
#' @param label The contents of the button or link–usually a text label.
#' @param icon An optional icon to appear on the button.
#' @param width The width of the input, e.g. \code{400px}, or \code{100\%}; see \link[htmltools]{validateCssUnit}.
#' @param ... Named attributes to be applied to the button.
#'
#' @export
#'
#' @importFrom htmltools validateCssUnit
#'
#' @examples
#' \dontrun{
#'
#' if (interactive()) {
#'
#' library(shiny)
#' library(wired)
#'
#' ui <- fluidPage(
#'   wired_button(
#'     inputId = "go",
#'     label = "GO!"
#'   ),
#'   tags$br(),
#'   verbatimTextOutput(outputId = "res")
#' )
#'
#' server <- function(input, output, session) {
#'
#'   output$res <- renderPrint(input$go)
#'
#' }
#'
#' shinyApp(ui, server)
#'
#' }
#'
#' }
wired_button <- function(inputId, label = NULL, icon = NULL, width = NULL, ...) {
  tag <- tagw$button(
    id = inputId, class = "action-button",
    style = if (!is.null(width)) paste0("width: ", validateCssUnit(width), ";"),
    list(icon, label), ...
  )
  wired_dependencies(tag)
}



#' Wired Icon Button
#'
#' @param inputId The \code{input} slot that will be used to access the value. The \code{input} slot that will be used to access the value.
#' @param icon An icon to appear on the button, use \href{https://material.io/tools/icons/?style=baseline}{Material icons}.
#' @param ... Named attributes to be applied to the button.
#'
#' @export
#'
#' @examples
#' \dontrun{
#'
#' if (interactive()) {
#'
#' library(shiny)
#' library(wired)
#'
#' ui <- fluidPage(
#'   wired_icon_button(
#'     inputId = "go",
#'     icon = "favorite"
#'   ),
#'   tags$br(),
#'   verbatimTextOutput(outputId = "res")
#' )
#'
#' server <- function(input, output, session) {
#'
#'   output$res <- renderPrint(input$go)
#'
#' }
#'
#' shinyApp(ui, server)
#'
#' }
#'
#' }
wired_icon_button <- function(inputId, icon, ...) {
  tag <- tagw$icon_button(
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
#' @examples
#' \dontrun{
#'
#' if (interactive()) {
#'
#' library(shiny)
#' library(wired)
#'
#' ui <- fluidPage(
#'   wired_checkbox(
#'     inputId = "chck",
#'     label = "Single checkbox"
#'   ),
#'   verbatimTextOutput(outputId = "res")
#' )
#'
#' server <- function(input, output, session) {
#'
#'   output$res <- renderPrint(input$chck)
#'
#' }
#'
#' shinyApp(ui, server)
#'
#' }
#'
#' }
wired_checkbox <- function(inputId, label, value = FALSE, width = NULL) {
  chckTag <- tagw$checkbox(label, id = inputId)
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
#' @examples
#' \dontrun{
#'
#' if (interactive()) {
#'
#' library(shiny)
#' library(wired)
#'
#' ui <- fluidPage(
#'   wired_select(
#'     inputId = "slct",
#'     label = "Select",
#'     choices = c("Normal",
#'                 "Uniform",
#'                 "Exponential")
#'   ),
#'   verbatimTextOutput(outputId = "res")
#' )
#'
#' server <- function(input, output, session) {
#'
#'   output$res <- renderPrint(input$slct)
#'
#' }
#'
#' shinyApp(ui, server)
#'
#' }
#'
#' }
wired_select <- function(inputId, label, choices, selected = NULL, width = NULL) {
  choices <- choicesWithNames(choices)
  if (is.null(selected)) {
    selected <- firstChoice(choices)
  }
  itemTags <- lapply(
    X = seq_along(choices),
    FUN = function(i) {
      tagw$item(value = choices[[i]], names(choices)[i])
    }
  )
  selectTag <- tagw$combo(itemTags, selected = selected, id = inputId)
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
#' @param radius Radius of the knob of the slider.
#' @param width The width of the input, e.g. \code{400px}, or \code{100\%}; see \link[htmltools]{validateCssUnit}.
#'
#' @export
#'
#' @importFrom htmltools tags validateCssUnit
#'
#' @examples
#' \dontrun{
#'
#' if (interactive()) {
#'
#' library(shiny)
#' library(wired)
#'
#' ui <- fluidPage(
#'   wired_slider(
#'     inputId = "sldr",
#'     label = "Slider:",
#'     min = 10,
#'     max = 60,
#'     value = 30,
#'     radius = 10
#'   ),
#'   verbatimTextOutput(outputId = "res")
#' )
#'
#' server <- function(input, output, session) {
#'
#'   output$res <- renderPrint(input$sldr)
#'
#' }
#'
#' shinyApp(ui, server)
#'
#' }
#'
#' }
wired_slider <- function(inputId, label = NULL, value = 10, min = 0, max = 100, radius = 20, width = NULL) {
  tag <- tags$div(
    class = "form-group shiny-input-container",
    style = if (!is.null(width)) paste0("width: ", validateCssUnit(width), ";"),
    tags$label(label, `for` = inputId), tags$br(),
    tagw$slider(id=inputId, knobradius=radius, value=value, min=min, max=max)
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
#' @examples
#' \dontrun{
#'
#' if (interactive()) {
#'
#' library(shiny)
#' library(wired)
#'
#' ui <- fluidPage(
#'   wired_radio(
#'     inputId = "radi", label = "Radio buttons:",
#'     choices = c("Normal" = "norm",
#'                 "Uniform" = "unif",
#'                 "Log-normal" = "lnorm",
#'                 "Exponential" = "exp")
#'   ),
#'   verbatimTextOutput(outputId = "res")
#' )
#'
#' server <- function(input, output, session) {
#'
#'   output$res <- renderPrint(input$radi)
#'
#' }
#'
#' shinyApp(ui, server)
#'
#' }
#'
#' }
wired_radio <- function(inputId, label, choices, selected = NULL, width = NULL) {
  choices <- choicesWithNames(choices)
  if (is.null(selected)) {
    selected <- firstChoice(choices)
  }
  radioTags <- lapply(
    X = seq_along(choices),
    FUN = function(i) {
      tagw$radio(name = choices[[i]], text = names(choices)[i], names(choices)[i])
    }
  )
  radioGroupTag <- tagw$radio_group(radioTags, selected = selected, id = inputId)
  tag <- tags$div(
    class = "form-group shiny-input-container",
    style = if (!is.null(width)) paste0("width: ", validateCssUnit(width), ";"),
    tags$label(label, `for` = inputId), tags$br(), radioGroupTag
  )
  wired_dependencies(tag)
}




#' Wired Ttoggle
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
#' @examples
#' \dontrun{
#'
#' if (interactive()) {
#'
#' library(shiny)
#' library(wired)
#'
#' ui <- fluidPage(
#'   wired_toggle(
#'     inputId = "tggl",
#'     label = "Toggle:"
#'   ),
#'   verbatimTextOutput(outputId = "res")
#' )
#'
#' server <- function(input, output, session) {
#'
#'   output$res <- renderPrint(input$tggl)
#'
#' }
#'
#' shinyApp(ui, server)
#'
#' }
#'
#' }
wired_toggle <- function(inputId, label, value = FALSE, width = NULL) {
  tgglTag <- tagw$toggle(id = inputId)
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
#' @param width The width of the input, e.g. \code{400px}, or \code{100\%}; see \link[htmltools]{validateCssUnit}.
#'
#' @export
#'
#' @importFrom htmltools tags validateCssUnit
#'
#' @examples
#' \dontrun{
#'
#' if (interactive()) {
#'
#' library(shiny)
#' library(wired)
#'
#' ui <- fluidPage(
#'   wired_text(
#'     inputId = "txt",
#'     label = "Text:",
#'     placeholder = "Write something!"
#'   ),
#'   verbatimTextOutput(outputId = "res")
#' )
#'
#' server <- function(input, output, session) {
#'
#'   output$res <- renderPrint(input$txt)
#'
#' }
#'
#' shinyApp(ui, server)
#'
#' }
#'
#' }
wired_text <- function(inputId, label = NULL, placeholder = NULL, width = NULL) {
  txtTag <- tagw$input(id = inputId, type = "text")
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


