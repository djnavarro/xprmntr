# file: helpers.R
# author: Danielle Navarro


#' Refer to a resource file
#'
#' @param file path
#' @export
resource <- function(file) {
  file.path("resources", file)
}


#' Specify js code directly
#'
#' @param x the code as a string
#' @export
unquote <- function(x) {
  class(x) <- "json"
  x
}
