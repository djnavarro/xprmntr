#' Trial with image stimulus and button response
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
#' @param ... Arguments to be passed to trial()
#' @export
trial_image_button <- function(
  stimulus,
  stimulus_height = NULL,
  stimulus_width = NULL,
  maintain_aspect_ratio = TRUE,

  choices,
  button_html = NULL,
  margin_vertical = "0px",
  margin_horizontal = "8px",

  prompt = NULL,
  stimulus_duration = NULL,
  trial_duration = NULL,
  response_ends_trial = TRUE,
  ...
) {
  drop_nulls(
    trial(
      type = "image-button-response",

      stimulus = stimulus,
      stimulus_height = stimulus_height,
      stimulus_width = stimulus_width,
      maintain_aspect_ratio = maintain_aspect_ratio,

      choices = choices,
      button_html = button_html,
      margin_vertical = margin_vertical,
      margin_horizontal = margin_horizontal,

      prompt = prompt,
      stimulus_duration = stimulus_duration,
      trial_duration = trial_duration,
      response_ends_trial = response_ends_trial,
      ...
    )
  )
}

#' Trial with image stimulus and keyboard response
#'
#' @param stimulus Image file, specified using the resource() function
#' @param stimulus_height Image height in pixels (defaults to natural height)
#' @param stimulus_width Image width in pixels (defaults to natural width)
#' @param maintain_aspect_ratio Maintain aspect ratio if only one of height/width specified? (default = TRUE)
#'
#' @param choices A character vector, any_key(), or no_key()
#'
#' @param prompt The prompt to be displayed with the stimulus (can include HTML markup)
#' @param stimulus_duration How long to display stimulus in milliseconds? (default is to remain until response)
#' @param trial_duration How long to wait for response in milliseconds? (default is to wait indefinitely)
#' @param response_ends_trial Does the trial end with response (default = TRUE) or continue until trial duration reached?
#' @param ... Arguments to be passed to trial()
#' @export
trial_image_key <- function(
  stimulus,
  stimulus_height = NULL,
  stimulus_width = NULL,
  maintain_aspect_ratio = TRUE,

  choices = any_key(),

  prompt = NULL,
  stimulus_duration = NULL,
  trial_duration = NULL,
  response_ends_trial = TRUE,
  ...
) {
  drop_nulls(
    trial(
      type = "image-keyboard-response",

      stimulus = stimulus,
      stimulus_height = stimulus_height,
      stimulus_width = stimulus_width,
      maintain_aspect_ratio = maintain_aspect_ratio,

      choices = choices,

      prompt = prompt,
      stimulus_duration = stimulus_duration,
      trial_duration = trial_duration,
      response_ends_trial = response_ends_trial,
      ...
    )
  )
}

#' Trial with image stimulus and slider response
#'
#' @param stimulus Image file, specified using the resource() function
#' @param stimulus_height Image height in pixels (defaults to natural height)
#' @param stimulus_width Image width in pixels (defaults to natural width)
#' @param maintain_aspect_ratio Maintain aspect ratio if only one of height/width specified? (default = TRUE)
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
#' @param ... Arguments to be passed to trial()
#' @export
trial_image_slider <- function(
  stimulus,
  stimulus_height = NULL,
  stimulus_width = NULL,
  maintain_aspect_ratio = TRUE,

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
  response_ends_trial = TRUE,
  ...
) {
  drop_nulls(
    trial(
      type = "image-slider-response",

      stimulus = stimulus,
      stimulus_height = stimulus_height,
      stimulus_width = stimulus_width,
      maintain_aspect_ratio = maintain_aspect_ratio,

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
      response_ends_trial = response_ends_trial,
      ...
    )
  )
}





