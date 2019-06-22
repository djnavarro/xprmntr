library(xprmntr)
library(magrittr)

# vector of file paths to the resources to be included
img <- c("rainbow.svg", "transgender.svg", "bisexual.svg")
img <- file.path(system.file("extdata", package = "rainbowr"), img)

# create an experiment with three trials
xpt <- jspsych_create(files = img) %>%
  jspsych_add(type = "image-keyboard-response", stimulus = res("rainbow.svg"),
              prompt = "Do you like this flag? (Y or N)", choices = c(89, 78)) %>%
  jspsych_add(type = "image-keyboard-response", stimulus = res("transgender.svg"),
              prompt = "Do you like this flag? (Y or N)", choices = c(89, 78)) %>%
  jspsych_add(type = "image-keyboard-response", stimulus = res("bisexual.svg"),
              prompt = "Do you like this flag? (Y or N)", choices = c(89, 78)) %>%
  jspsych_add(type = "survey-likert", questions = list(list(
    prompt = "How much did you enjoy this?",
    labels = c("a lot", "not much", "not at all"), required = TRUE))) %>%
  jspsych_init(default_iti = 250,
               on_finish = "function () {xprmntr.savelocally('~/Desktop/blah.csv', jsPsych.data.get().csv())}")

# write it to an html file
jspsych_write(xpt, "~/Desktop/expt")

