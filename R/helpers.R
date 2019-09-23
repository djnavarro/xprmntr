# file: helpers.R
# author: Danielle Navarro


#' Refer to a resource file
#'
#' @param file path
#' @export
resource <- function(file) {
  #purrr::map_chr(file, function(.x) {attr(.x, "resource")  <- TRUE; .x}, )
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
