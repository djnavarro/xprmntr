#' Initialise an experiment
#' @export
jspsych_create <- function() {
  xpt <- list()
  xpt$head <- list()
  xpt$head$script <- "jspsych.js"
  xpt$head$style <- file.path("css", "jspsych.css")
  xpt$trial <- list()
  xpt$init <- list()
  return(xpt)
}
#' Add trial that shows an image and respond with keyboard
#' @param xpt the experiment object
#' @param stimulus path to an image file
#' @param choices numeric codes for allowed responses
#' @param prompt text of the response prompt
#' @export
jspsych_add <-function(xpt, type, options = list()) {

  # append the trial information to the list
  trial_number <- length(xpt$trial) + 1
  xpt$trial[[trial_number]] <- c(list(type = type), options)

  # specify path to plugin file
  plugin <- file.path("plugins", paste0("jspsych-", type, ".js"))

  # make sure the plugin file is listed
  if(!plugin %in% xpt$head$script) {
    xpt$head$script <- c(xpt$head$script, plugin)
  }

  return(xpt)
}

#' Construct a call to jsPsych.init
#'
#'
jspsych_init <- function(xpt) {


}



#' Convert the experiment object to HTML file
#'
#' @param  xpt the experiment object
#' @export
jspsych_write <- function(xpt, path) {

  # create experiment folder with jspsych files
  dir.create(path)
  utils::unzip(
    zipfile = system.file("extdata", "jspsych-6.0.5.zip", package = "xprmntr"),
    exdir = path)

  # write the trial list to a js file
  tl <- jspsychify_timeline(xpt$trial)

  tl <- c(tl, "jsPsych.init({
    timeline: [trial_1, trial_2, trial_3],
    default_iti: 250
  });")

  writeLines(tl, file.path(path, "experiment.js"))

  # header info for html file
  html <- c(
    '<!DOCTYPE html>',
    '  <html lang="en-us">',
    '  <head>',
    paste0('    <script src = "', xpt$head$script, '"></script>'),
    paste0('    <script src = "experiment.js"></script>'),
    paste0('    <link rel="stylesheet" href="', xpt$head$style, '">'),
    '  </head>',
    '  <body>',
    '  </body>',
    '</html>'
  )

  # write the file
  writeLines(html, file.path(path, "index.html"))

  # invisibly return the input
  return(invisible(xpt))
}


# create the timeline string
jspsychify_timeline <- function(timeline) {

  ntr <- length(timeline)
  tl_str <- character()
  for(tr in 1:ntr) {
    tl_str <- c(tl_str, '', paste0(
        'var trial_', tr, ' = ',
        jspsychify_trial(xpt$trial[[tr]]) , ";")
    )
  }
  return(tl_str)
}

# convert a single trial to an appropriate json string
jspsychify_trial <- function(trial) {
  jsonlite::toJSON(trial, auto_unbox = TRUE)
}

