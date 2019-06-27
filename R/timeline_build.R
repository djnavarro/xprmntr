# file: timeline_build.R
# author: Danielle Navarro

#' Initialise an experiment
#'
#' @param files character listing files to include
#' @export
jspsych_create <- function(files) {
  xpt <- list()
  xpt$script <- "jspsych.js"
  xpt$style <- "jspsych.css"
  xpt$trial <- list()
  xpt$init <- list()
  xpt$files <- files
  return(xpt)
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
  if(!plugin %in% xpt$script) {
    xpt$script <- c(xpt$script, plugin)
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

