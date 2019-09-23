# file: timeline_build.R
# author: Danielle Navarro

#' Initialise a timeline
#'
#' @param scripts character vector listing user files to include
#' @param stylesheets character vector listing jspsych files to include
#' @param resources dsgdsf
#' @details If no arguments are specified, the resources field is empty,
#' and the jspsych field contains the core jspsych library and css files
#' @export
tl_new <- function(
  scripts = "jspsych.js",
  stylesheets = "jspsych.css",
  resources = character()
) {
  new_timeline(
    scripts = scripts,
    stylesheets = stylesheets,
    resources = resources
  )
}

# constructor function
new_timeline <- function(
  trials = list(),
  scripts = "jspsych.js",
  stylesheets = "jspsych.css",
  resources = character()
){
  list(
    trials = trials,
    scripts = scripts,
    stylesheets = stylesheets,
    resources = resources
  )
}

#' Adds an arbitrary trial block to the timeline
#' @param timeline the timeline object
#' @param type the type of trial block
#' @param ... arguments passed to the trial plugin
#' @export
tl_add <- function(timeline, type, ...) {

  # make an addition to the timeline
  ind <- length(timeline$trials) + 1
  timeline$trials[[ind]] <- c(list(type = type), list(...))

  # specify path to plugin file
  plugin <- paste0("jspsych-", type, ".js")

  # make sure the plugin file is listed
  if(!plugin %in% timeline$scripts) {
    timeline$scripts <- c(timeline$scripts, plugin)
  }
  return(timeline)
}



