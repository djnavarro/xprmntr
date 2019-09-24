# file: timeline_build.R
# author: Danielle Navarro

#' Initialise a timeline
#' @export
timeline <- function(...){
  tl <- list(timeline = list(...))
  class(tl) <- c("timeline", "list")
  tl
}

#' Adds an arbitrary trial block to the timeline
#' @param type the type of trial block
#' @param ... arguments passed to the trial plugin
#' @export
trial <- function(type, ...) {
  return(c(list(type = type), list(...)))
}

#' Insert a timeline variable
#'
#' @param name name of the variable to insert
#'
#' @export
#'
use_variable <- function(name) {
  str <- paste0("jsPsych.timelineVariable('",name, "')")
  return(code(str))
}

#' Attach a timeline variable to timeline object
#'
#' @param timeline the timeline object
#' @param ... name value pairs
#'
#' @export
with_variables <- function(timeline, ...) {
  vars <- list(...)
  vars <- purrr::transpose(vars)
  timeline[["timeline_variables"]] <- vars
  return(timeline)
}

#' Attach a timeline variable to timeline object
#'
#' @param timeline the timeline object
#' @param ... name value pairs
#'
#' @export
with_parameters <- function(timeline, ...) {
  timeline <- c(timeline, ...)
  return(timeline)
}


