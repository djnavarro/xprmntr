
#' Create an HTML stimulus trial with keyboard response
#'
#' @param stimulus the HTML stimulus
#' @param choices character vector specifying allowed response keys
#' @param prompt the prompt to be displayed with the stimulus
#' @param stimulus_duration how long the stimulus is displayed
#' @param trial_duration how long the trial lasts
#' @param response_ends_trial default = TRUE
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
      prompt = prompt,
      stimulus_duration = stimulus_duration,
      response_ends_trial = response_ends_trial
    )
  )
}



#' Create an HTML stimulus trial with button press response
#'
#' @param stimulus the HTML stimulus
#' @param choices character vector specifying labels
#' @param prompt the prompt to be displayed with the stimulus
#' @param stimulus_duration how long the stimulus is displayed
#' @param trial_duration how long the trial lasts
#' @param response_ends_trial default = TRUE
#' @param button_html HTML specifying the buttons (defaults to jsPsych default)
#' @param margin_vertical vertical margin of the buttons
#' @param margin_horizontal horizontal margin of the buttons
#'
#' @export
html_button_response <- function(
  stimulus,
  choices,
  prompt = NULL,
  stimulus_duration = NULL,
  trial_duration = NULL,
  response_ends_trial = TRUE,
  button_html = NULL,
  margin_vertical = "0px",
  margin_horizontal = "8px"
) {
  drop_nulls(
    trial(
      type = "html-keyboard-response",
      stimulus = stimulus,
      prompt = prompt,
      stimulus_duration = stimulus_duration,
      response_ends_trial = response_ends_trial,
      button_html = button_html,
      margin_vertical = margin_vertical,
      margin_horizontal = margin_horizontal
    )
  )
}


#' Create an HTML stimulus trial with slider response
#'
#' @param stimulus the HTML stimulus
#' @param labels labels to be spaced equally along slider
#' @param button_label text for the button
#' @param min min value of slider
#' @param max max value of slider
#' @param start start point of slider
#' @param step smallest increment of slider movement
#' @param slider_width horizontal width of slider
#' @param require_movement does user need to move the slider?
#' @param prompt the prompt to be displayed with the stimulus
#' @param stimulus_duration how long the stimulus is displayed
#' @param trial_duration how long the trial lasts
#' @param response_ends_trial default = TRUE
#'
#' @return
#' @export
#'
#' @examples
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


