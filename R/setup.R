#' Initialise an experiment
#'
#' @param files character listing files to include
#' @export
jspsych_create <- function(files) {
  xpt <- list()
  xpt$head <- list()
  xpt$head$script <- "jspsych.js"
  xpt$head$style <- file.path("css", "jspsych.css")
  xpt$trial <- list()
  xpt$init <- list()
  xpt$files <- files
  return(xpt)
}

#' Refer to a resource file
#'
#' @param file path
#' @export
res <- function(file) {
  file.path("resources", file)
}

#' Add trial that shows an image and respond with keyboard
#' @param xpt the experiment object
#' @param type the type of trial
#' @param ... arguments passed to the trial plugin
#' @export
jspsych_add <- function(xpt, type, ...) {

  # append the trial information to the list
  trial_number <- length(xpt$trial) + 1
  xpt$trial[[trial_number]] <- c(list(type = type), list(...))

  # specify path to plugin file
  plugin <- file.path("plugins", paste0("jspsych-", type, ".js"))

  # make sure the plugin file is listed
  if(!plugin %in% xpt$head$script) {
    xpt$head$script <- c(xpt$head$script, plugin)
  }

  return(xpt)
}


#' Options on initialisation
#'
#' @param xpt the experiment
#' @param ... arguments passed to init
#' @export
jspsych_init <- function(xpt, ...) {

  xpt$init <- list(...)
  return(xpt)

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
  dir.create(file.path(path, "resources"))
  file.copy(xpt$files, file.path(path, "resources"))

  # write the experiment to a js string
  task <- c(list(timeline = xpt$trial), xpt$init)
  json <- jsonlite::toJSON(task, auto_unbox = TRUE, pretty = TRUE)
  expt <- paste("jsPsych.init(", json, ");", sep = "\n")
  writeLines(expt, file.path(path, "experiment.js"))

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

