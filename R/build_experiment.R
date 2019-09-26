# file: experiment_write.R
# author: Danielle Navarro


#' Make the experiment
#'
#' @param timeline tl
#' @param path  p
#' @param resources r
#' @param ... pass to init
#'
#' @export
experiment <- function(timeline, path, resources = NULL, ...) {

  # set up
  init <- list(...)
  scripts <- "jspsych.js"
  stylesheets <- "jspsych.css"

  # use the timeline to discover plugins
  flattl <- unlist(timeline)
  plugins <- flattl[grep(pattern = "type$", x = names(flattl))]
  plugins <- unique(unname(plugins))
  plugins <- paste0("jspsych-", plugins, ".js")
  scripts <- c(scripts, plugins)

  # create tree
  dir.create(path)
  dir.create(file.path(path, "experiment"))
  dir.create(file.path(path, "experiment", "resources"))
  dir.create(file.path(path, "experiment", "jspsych"))
  dir.create(file.path(path, "experiment", "xprmntr"))
  dir.create(file.path(path, "data"))

  # copy resource files
  if(!is.null(resources)) {
    file.copy(
      from = list.files(resources, full.names = TRUE),
      to = file.path(path, "experiment", "resources"),
      recursive = TRUE
    )
  }
  # copy jspsych files
  file.copy(
    from = system.file(
      "extdata", "jsPsych-6.1.0", c(scripts, stylesheets),
      package = "xprmntr"
    ),
    to = file.path(path, "experiment", "jspsych")
  )

  # copy xprmntr files
  file.copy(
    from = system.file("extdata", "xprmntr.js", package = "xprmntr"),
    to = file.path(path, "experiment", "xprmntr")
  )

  # write the timeline to a js string
  timeline_json <- paste(
    "var timeline = ",
    jsonlite::toJSON(timeline, pretty = TRUE, json_verbatim = TRUE),
    ";\n", sep = ""
  )

  # write the initialisation to a js string
  task <- c(list(timeline = js_code("[timeline]")), init)
  init_json <- paste(
    "jsPsych.init(",
    jsonlite::toJSON(task, pretty = TRUE, json_verbatim = TRUE),
    ");", sep = "\n"
  )

  # write both to file
  writeLines(
    text = c(timeline_json, init_json),
    con = file.path(path, "experiment", "experiment.js")
  )

  # header info for html file
  html <- c(
    '<!DOCTYPE html>',
    '  <html lang="en-us">',
    '  <head>',
    paste0('    <script src = "jspsych/', scripts, '"></script>'),
    paste0('    <script src = "xprmntr/xprmntr.js"></script>'),
    paste0('    <script src = "experiment.js"></script>'),
    paste0('    <link rel="stylesheet" href="jspsych/', stylesheets, '">'),
    '  </head>',
    '  <body>',
    '  </body>',
    '</html>'
  )

  # write the file
  writeLines(html, file.path(path, "experiment", "index.html"))

  return(invisible(NULL))

}
