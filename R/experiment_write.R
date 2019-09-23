# file: experiment_write.R
# author: Danielle Navarro

#' Options on initialisation
#'
#' @param timeline a timeline object
#' @param ... arguments passed to init
#' @export
jspsych_init <- function(timeline, ...) {

  # an experiment is a timeline plus settings
  xpt <- timeline
  xpt$init <- list(...)
  return(xpt)

}

#' Convert the experiment object to HTML file
#'
#' @param xpt the experiment object
#' @param path where to write the experiment
#' @export
jspsych_write <- function(xpt, path) {

  # create tree
  dir.create(path)
  dir.create(file.path(path, "experiment"))
  dir.create(file.path(path, "experiment", "resources"))
  dir.create(file.path(path, "experiment", "jspsych"))
  dir.create(file.path(path, "experiment", "xprmntr"))
  dir.create(file.path(path, "data"))

  # copy resource files
  file.copy(
    from = xpt$resources,
    to = file.path(path, "experiment", "resources")
  )

  # copy jspsych files
  file.copy(
    from = system.file(
      "extdata", "jspsych-6.0.5", c(xpt$scripts, xpt$stylesheets),
      package = "xprmntr"
    ),
    to = file.path(path, "experiment", "jspsych")
  )
  # copy xprmntr files
  file.copy(
    from = system.file("extdata", "xprmntr.js", package = "xprmntr"),
    to = file.path(path, "experiment", "xprmntr")
  )

  # write the experiment to a js string
  task <- c(list(timeline = xpt$trials), xpt$init)
  json <- jsonlite::toJSON(task, auto_unbox = TRUE, pretty = TRUE, json_verbatim = TRUE)
  expt <- paste("jsPsych.init(", json, ");", sep = "\n")
  writeLines(expt, file.path(path, "experiment", "experiment.js"))

  # header info for html file
  html <- c(
    '<!DOCTYPE html>',
    '  <html lang="en-us">',
    '  <head>',
    paste0('    <script src = "jspsych/', xpt$scripts, '"></script>'),
    paste0('    <script src = "xprmntr/xprmntr.js"></script>'),
    paste0('    <script src = "experiment.js"></script>'),
    paste0('    <link rel="stylesheet" href="jspsych/', xpt$stylesheets, '">'),
    '  </head>',
    '  <body>',
    '  </body>',
    '</html>'
  )

  # write the file
  writeLines(html, file.path(path, "experiment", "index.html"))

  # invisibly return the input
  return(invisible(xpt))
}
