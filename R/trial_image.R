
#' Image stimulus, button response
#'
#' @param stimulus Image file, specified using the resource() function
#' @param stimulus_height Image height in pixels (defaults to natural height)
#' @param stimulus_width Image width in pixels (defaults to natural width)
#' @param maintain_aspect_ratio Maintain aspect ratio if only one of height/width specified? (default = TRUE)
#'
#' @param choices Character vector with labels for the buttons
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
image_button_response <- function(
  stimulus,
  stimulus_height = NULL,
  stimulus_width = NULL,
  maintain_aspect_ratio = TRUE,
  choices = character(0),
  button_html = NULL,
  prompt = NULL,
  stimulus_duration = NULL,
  trial_duration = NULL,
  margin_vertical = "0px",
  margin_horizontal = "8px",
  response_ends_trial = TRUE
) {
  drop_nulls(
    trial(
      stimulus = stimulus,
      stimulus_height = stimulus_height,
      stimulus_width = stimulus_width,
      maintain_aspect_ratio = maintain_aspect_ratio,
      choices = choices,
      button_html = button_html,
      prompt = prompt,
      stimulus_duration = stimulus_duration,
      trial_duration = trial_duration,
      margin_vertical = margin_vertical,
      margin_horizontal = margin_horizontal,
      response_ends_trial = response_ends_trial
    )
  )
}




