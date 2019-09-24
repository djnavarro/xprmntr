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
  return(unquote(str))
}

#' Attach a timeline variable to timeline object
#'
#' @param timeline the timeline object
#' @param name name of the variable
#' @param values possible values for the variable
#'
#' @export
with_variable <- function(timeline, name, values) {
  #names(values) <- rep(name, length(values))
  #variable <- as.list(values)
  variable <- purrr::map(
    .x = values,
    .f = function(x) {l <- list(x); names(l) <- name; l}
  )
  timeline[["timeline_variables"]] <- variable
  return(timeline)
}
