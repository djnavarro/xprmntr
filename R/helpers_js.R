

#' Interpret as raw javascript
#'
#' @param x the code as a string
#' @export
js_code <- function(x) {
  class(x) <- "json"
  x
}

#' Interpret as javascript logical
#'
#' @param x a value to be coerced to logical
#' @export
js_logical <- function(x) {
  as.logical(x)
}

#' Interpret as javascript numeric
#'
#' @param x a value to be coerced to numeric
#' @export
js_numeric <- function(x) {
  as.numeric(x)
}


#' Interpret as javascript string
#' @param ... strings to be concatenated with +
#' @export
js_string <- function(...) {
  s <- list(...)
  string_quote <- function(c) {
    if(methods::is(c,"json")) { return(c) }
    return(paste0('"',c,'"'))
  }
  s <- paste(lapply(s, string_quote), collapse = " + ")
  js_code(s)
}

#' Interpret as javascript structure
#'
#' @param ... list of name/value pairs
#'
#' @export
js_struct <- function(...) {
  list(...)
}

#' Interpret as javascript array
#'
#' @param ... values pairs
#'
#' @export
js_array <- function(...) {
  classes <- purrr::map_chr(list(...), ~ class(.x)[1])
  if(any(classes == "list")) {
    return(list(...))
  }
  return(c(...))
}

list_to_jsarray <- purrr::lift_dl(js_array)


