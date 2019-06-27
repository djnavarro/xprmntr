# file: experiment_write.R
# author: Danielle Navarro


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
  dir.create(file.path(path, "experiment", "jspsych", "css"))
  dir.create(file.path(path, "experiment", "jspsych", "plugins"))
  dir.create(file.path(path, "experiment", "xprmntr"))
  dir.create(file.path(path, "data"))

  # copy all the resources
  file.copy(xpt$files, file.path(path, "experiment", "resources"))

  # copy the relevant jspsych files
  file.copy(system.file("extdata", "jspsych-6.0.5", xpt$script, package = "xprmntr"),
            file.path(path, "experiment", "jspsych"))
  file.copy(system.file("extdata", "jspsych-6.0.5", xpt$style, package = "xprmntr"),
            file.path(path, "experiment", "jspsych"))

  # copy the xprmntr files
  file.copy(system.file("extdata", "xprmntr.js", package = "xprmntr"),
            file.path(path, "experiment", "xprmntr"))

  # write the experiment to a js string
  task <- c(list(timeline = xpt$trial), xpt$init)
  json <- jsonlite::toJSON(task, auto_unbox = TRUE, pretty = TRUE, json_verbatim = TRUE)
  expt <- paste("jsPsych.init(", json, ");", sep = "\n")
  writeLines(expt, file.path(path, "experiment", "experiment.js"))

  # header info for html file
  html <- c(
    '<!DOCTYPE html>',
    '  <html lang="en-us">',
    '  <head>',
    paste0('    <script src = "jspsych/', xpt$script, '"></script>'),
    paste0('    <script src = "xprmntr/xprmntr.js"></script>'),
    paste0('    <script src = "experiment.js"></script>'),
    paste0('    <link rel="stylesheet" href="jspsych/', xpt$style, '">'),
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
