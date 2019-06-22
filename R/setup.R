#' Initialise an experiment
#'
#' @param files character listing files to include
#' @export
jspsych_create <- function(files) {
  xpt <- list()
  xpt$head <- list()
  xpt$head$script <- "jspsych.js"
  xpt$head$style <- "jspsych.css"
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

#' Specify js code directly
#'
#' @param x the code as a string
#' @export
verbatim <- function(x) {
  class(x) <- "json"
  x
}

#' Run a jspsych experiment
#'
#' @param path path
#' @export
run <- function(path = ".") {

  pr <- plumber::plumber$new()

  static_site <- file.path(path, "experiment")
  static_router <- plumber::PlumberStatic$new(static_site)

  pr$mount("/", static_router)
  pr$handle("POST", "/submit", function(req, res){
    print(req$postBody)
  })

  pr$run(swagger = FALSE)
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
  plugin <- paste0("jspsych-", type, ".js")

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
  file.copy(system.file("extdata", "jspsych-6.0.5", xpt$head$script, package = "xprmntr"),
            file.path(path, "experiment", "jspsych"))
  file.copy(system.file("extdata", "jspsych-6.0.5", xpt$head$style, package = "xprmntr"),
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
    paste0('    <script src = "jspsych/', xpt$head$script, '"></script>'),
    paste0('    <script src = "xprmntr/xprmntr.js"></script>'),
    paste0('    <script src = "experiment.js"></script>'),
    paste0('    <link rel="stylesheet" href="jspsych/', xpt$head$style, '">'),
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

