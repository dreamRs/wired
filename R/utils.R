
# utils from shiny

choicesWithNames <- function (choices) {
  listify <- function(obj) {
    makeNamed <- function(x) {
      if (is.null(names(x)))
        names(x) <- character(length(x))
      x
    }
    res <- lapply(obj, function(val) {
      if (is.list(val))
        listify(val)
      else if (length(val) == 1 && is.null(names(val)))
        as.character(val)
      else makeNamed(as.list(val))
    })
    makeNamed(res)
  }
  choices <- listify(choices)
  if (length(choices) == 0)
    return(choices)
  choices <- mapply(choices, names(choices), FUN = function(choice,
                                                            name) {
    if (!is.list(choice))
      return(choice)
    if (name == "")
      stop("All sub-lists in \"choices\" must be named.")
    choicesWithNames(choice)
  }, SIMPLIFY = FALSE)
  missing <- names(choices) == ""
  names(choices)[missing] <- as.character(choices)[missing]
  choices
}

firstChoice <- function (choices)
{
  if (length(choices) == 0L)
    return()
  choice <- choices[[1]]
  if (is.list(choice))
    firstChoice(choice)
  else choice
}


