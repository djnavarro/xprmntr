library(xprmntr)
library(magrittr)

# vector of file paths to the resources to be included
img <- c("rainbow.svg", "transgender.svg", "bisexual.svg")
img_paths <- file.path(system.file("extdata", package = "rainbowr"), img)

# create an experiment
tl <- tl_new(resources = img_paths) %>%
  tl_add(
    type = "image-keyboard-response",
    stimulus = resource(img[1]),
    prompt = "Do you like this flag? (Y or N)",
    choices = c(89, 78)
  ) %>%
  tl_add(
    type = "survey-likert",
    questions = list(list(
      prompt = "How much did you enjoy this?",
      labels = c("a lot", "not much", "not at all"),
      required = TRUE
    ))
  )

# initialise the jspsych experiment
xpt <- jspsych_init(
  timeline = tl,
  default_iti = 250,
  on_finish = unquote("xprmntr.save_locally")
)

# write it to an html file
jspsych_write(xpt, "~/Desktop/expt")
run_locally("~/Desktop/expt")
