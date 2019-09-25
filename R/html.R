
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

