#' Define a response slider
#'
#' @param labels Character vector of labels, to be spaced equally along slider
#' @param button_label Text displayed on button at the end (default = "Continue")
#' @param min Minimum value of the slider (default = 0)
#' @param max Maximum value of the slider (default = 100)
#' @param start Starting value of the slider (default = 50)
#' @param step Smallest increment of slider movement (default = 1)
#' @param slider_width Horizontal width of slider (defaults to max width)
#' @param require_movement Does user need to move the slider to continue? (default = FALSE)
#'
#' @export
respond_slider <- function(
  labels = NULL,
  button_label = "Continue",
  min = 0,
  max = 100,
  start = 50,
  step = 1,
  slider_width = NULL,
  require_movement = FALSE
) {
  list(
    labels = labels,
    button_label = button_label,
    min = min,
    max = max,
    start = start,
    step = step,
    slider_width = slider_width,
    require_movement = require_movement
  )
}

#' Define response buttons
#'
#' @param choices Character vector with labels for the buttons
#' @param button_html HTML templay specifying the buttons (defaults to jsPsych default)
#' @param margin_vertical Vertical margin of the buttons (default "0px")
#' @param margin_horizontal Horizontal margin of the buttons (default "8px")
#'
#' @export
respond_button <- function(
  choices,
  button_html = NULL,
  margin_vertical = "0px",
  margin_horizontal = "8px"
) {
  list(
    choices = choices,
    button_html = button_html,
    margin_vertical = margin_vertical,
    margin_horizontal = margin_horizontal
  )
}


#' Define a keyboard responder
#'
#' @param ... Either single string "any" (default), "none", or characters specifying keys
#'
#' @export
respond_key <- function(...) {
  keys <- list(...)

  choices <- unlist(keys)
  if(length(keys)==0) choices <- js_code("jsPsych.ANY_KEY")
  if(length(keys)==1) {
    if(keys == "any") choices <- js_code("jsPsych.ANY_KEY")
    if(keys == "none") choices <- js_code("jsPsych.No_KEY")
  }
  list(
    choices = choices
  )
}
