# file: timeline_build.R
# author: Danielle Navarro

#' Initialise a timeline
#' @export
timeline <- function(...){
  list(timeline = list(...))
}

#' Adds an arbitrary trial block to the timeline
#' @param type the type of trial block
#' @param ... arguments passed to the trial plugin
#' @export
trial <- function(type, ...) {
  return(c(list(type = type), list(...)))
}

#' Title
#'
#' @param name
#'
#' @export
#'
use_variable <- function(name) {
  str <- paste0("jsPsych.timelineVariable('",name, "')")
  return(unquote(str))
}

#' Title
#'
#' @param timeline
#' @param name
#' @param values
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
