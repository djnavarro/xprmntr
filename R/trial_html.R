
#' HTML stimulus, keyboard response
#'
#' @param stimulus HTML stimulus
#'
#' @param choices Character vector specifying the allowed response keys (default = any_key())
#'
#' @param prompt The prompt to be displayed with the stimulus (can include HTML markup)
#' @param stimulus_duration How long to display stimulus in milliseconds? (default is to remain until response)
#' @param trial_duration How long to wait for response in milliseconds? (default is to wait indefinitely)
#' @param response_ends_trial Does the trial end with response (default = TRUE) or continue until trial duration reached?
#'
#' @export
html_keyboard_response <- function(
  stimulus,
  choices = any_key(),
  prompt = NULL,
  stimulus_duration = NULL,
  trial_duration = NULL,
  response_ends_trial = TRUE
) {
  drop_nulls(
    trial(
      type = "html-keyboard-response",
      stimulus = stimulus,
      choices = choices,
      prompt = prompt,
      stimulus_duration = stimulus_duration,
      trial_duration = trial_duration,
      response_ends_trial = response_ends_trial
    )
  )
}



#' HTML stimulus, button response
#'
#' @param stimulus HTML stimulus
#'
#' @param choices Character vector with labels for the buttons
#'
#' @param button_html HTML templay specifying the buttons (defaults to jsPsych default)
#' @param margin_vertical Vertical margin of the buttons (default "0px")
#' @param margin_horizontal Horizontal margin of the buttons (default "8px")
#'
#' @param prompt The prompt to be displayed with the stimulus (can include HTML markup)
#' @param stimulus_duration How long to display stimulus in milliseconds? (default is to remain until response)
#' @param trial_duration How long to wait for response in milliseconds? (default is to wait indefinitely)
#' @param response_ends_trial Does the trial end with response (default = TRUE) or continue until trial duration reached?
#'
#' @export
html_button_response <- function(
  stimulus,
  choices,
  button_html = NULL,
  margin_vertical = "0px",
  margin_horizontal = "8px",
  prompt = NULL,
  stimulus_duration = NULL,
  trial_duration = NULL,
  response_ends_trial = TRUE
) {
  drop_nulls(
    trial(
      type = "html-keyboard-response",
      stimulus = stimulus,
      choices = choices,
      button_html = button_html,
      margin_vertical = margin_vertical,
      margin_horizontal = margin_horizontal,
      prompt = prompt,
      stimulus_duration = stimulus_duration,
      trial_duration = trial_duration,
      response_ends_trial = response_ends_trial
    )
  )
}


#' HTML stimulus, slider response
#'
#' @param stimulus HTML stimulus
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
#' @param prompt The prompt to be displayed with the stimulus (can include HTML markup)
#' @param stimulus_duration How long to display stimulus in milliseconds? (default is to remain until response)
#' @param trial_duration How long to wait for response in milliseconds? (default is to wait indefinitely)
#' @param response_ends_trial Does the trial end with response (default = TRUE) or continue until trial duration reached?
#'
#' @export
html_slider_response <- function(
  stimulus,
  labels = NULL,
  button_label = "Continue",
  min = 0,
  max = 100,
  start = 50,
  step = 1,
  slider_width = NULL,
  require_movement = FALSE,
  prompt = NULL,
  stimulus_duration = NULL,
  trial_duration = NULL,
  response_ends_trial = TRUE
) {
  drop_nulls(
    trial(
      type = "html-keyboard-response",
      stimulus = stimulus,
      labels = labels,
      button_label = button_label,
      min = min,
      max = max,
      start = start,
      step = step,
      slider_width = slider_width,
      require_movement = require_movement,
      prompt = prompt,
      stimulus_duration = stimulus_duration,
      trial_duration = trial_duration,
      response_ends_trial = response_ends_trial
    )
  )
}


