
#' Specify js code directly
#'
#' @param x the code as a string
#' @export
js_raw <- function(x) {
  class(x) <- "json"
  x
}


#' Specify js string directly
#' @param type the type of trial block
#' @param ... arguments passed to the trial plugin
#' @export
js_string <- function(...) {
  s <- list(...)
  string_quote <- function(c) {
    if(is(c,"json")) { return(c) }
    return(paste0('"',c,'"'))
  }
  s <- paste(lapply(s, string_quote), collapse = " + ")
  js_raw(s)
}
