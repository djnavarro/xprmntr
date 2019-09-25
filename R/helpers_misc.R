# file: helpers.R
# author: Danielle Navarro

#' Use any key to respond
#' @export
any_key <- function() {
  js_code("jsPsych.ANY_KEY")
}

#' No key will register a response
#' @export
no_key <- function() {
  js_code("jsPsych.NO_KEY")
}


#' Refers to a resource file
#'
#' @param file path
#' @export
resource <- function(file) {
  file.path("resources", file)
}

drop_nulls <- function(x) {
  x[purrr::map_lgl(x, ~!is.null(.x))]
}

# returns a list of expressions
capture_dots <- function(...) {
  as.list(substitute(list(...)))[-1L]
}

#' @importFrom magrittr %>%
#' @export
magrittr::`%>%`

get_timestamp <- function() {
  tsp <- as.character(Sys.time())
  tsp <- gsub("[ :]", "-", tsp)
  return(tsp)
}

get_alphanumeric <- function(n = 5) {
  x <- c("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r",
         "s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9")
  r <- sample(x, size = n, replace = TRUE)
  r <- paste(r, collapse = "")
  return(r)
}
