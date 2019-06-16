#' Initialise an experiment
#' @export
xpt_create <- function() {
  xpt <- list()
  xpt$head <- list()
  xpt$head$script <- system.file("extdata", "jspsych.js", package = "xprmntr", mustWork = TRUE)
  xpt$head$style <- system.file("extdata", "css", "jspsych.css", package = "xprmntr", mustWork = TRUE)
  xpt$trial <- list()
  return(xpt)
}

#' Add trial that shows an image and respond with keyboard
#' @param xpt the experiment object
#' @param stimulus path to an image file
#' @param choices numeric codes for allowed responses
#' @param prompt text of the response prompt
#' @export
xpt_image_keyboard_response <-function(xpt, stimulus, choices, prompt) {

  xpt$trial[[length(xpt$trial) + 1]] <- list(
    type = "image-keyboard-response",
    stimulus = stimulus,
    choices = choices,
    prompt = prompt
  )

  plugin <- system.file("extdata", "plugins", "jspsych-image-keyboard-response.js", package = "xprmntr", mustWork = TRUE)
  if(!plugin %in% xpt$head$script) {
    xpt$head$script <- c(xpt$head$script, plugin)
  }

  return(xpt)
}


#' Convert the experiment object to HTML file
#'
#' @param  xpt the experiment object
#' @export
xpt_write <- function(xpt, file) {

  # initialise
  html <- c(
    '<!DOCTYPE html>',
    '  <html>'
  )

  # add scripts style files in the head
  html <- c(
    html,
    '  <head>',
    paste0('    <script src="', xpt$head$script, '"></script>'),
    paste0('    <link rel="stylesheet" href="', xpt$head$style, '">'),
    '  </head>'
  )

  # the body is empty
  html <- c(
    html,
    '  <body>',
    '  </body>'
  )

  # open script tag defining trials
  html <- c(
    html,
    '  <script>'
  )

  # add trials
  ntr <- length(xpt$trial)
  for(tr in 1:ntr) {
    html <- c(
      html,
      '',
      paste0('var trial_', tr, ' = {'),
      '  type: "image-keyboard-response",',
      paste0('  stimulus: "', xpt$trial[[tr]]$stimulus , '",'),
      paste0('  choices: [', paste(xpt$trial[[tr]]$choices, collapse = ",") ,'],'),
      paste0('  prompt: "', xpt$trial[[tr]]$prompt , '",'),
      '}'
    )
  }

  # create timeline object
  html <- c(
    html,
    '',
    'jsPsych.init({',
    paste0('  timeline: [', paste0("trial_", 1:ntr, collapse = ", "),'],'),
    '  default_iti: 250',
    '});'
  )

  # close script tag defining trials & document
  html <- c(
    html,
    '  </script>',
    '</html>'
  )

  # write the file
  writeLines(html, file)

  # invisibly return the input
  return(invisible(xpt))
}
