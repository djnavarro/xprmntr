
#' Define an image stimulus
#'
#' @param stimulus Image file, specified using the resource() function
#' @param stimulus_height Image height in pixels (defaults to natural height)
#' @param stimulus_width Image width in pixels (defaults to natural width)
#' @param maintain_aspect_ratio Maintain aspect ratio if only one of height/width specified? (default = TRUE)
#' @export
stimulus_image <- function(
  stimulus,
  stimulus_height = NULL,
  stimulus_width = NULL,
  maintain_aspect_ratio = TRUE
){
  list(
    stimulus = stimulus,
    stimulus_height = stimulus_height,
    stimulus_width = stimulus_width,
    maintain_aspect_ratio = maintain_aspect_ratio
  )
}

#' Define an HTML stimulus
#'
#' @param stimulus HTML
#' @export
stimulus_html <- function(stimulus){
  return(stimulus)
}

