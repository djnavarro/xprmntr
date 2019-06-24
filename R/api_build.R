# file: api_build.R
# author: Danielle Navarro


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
