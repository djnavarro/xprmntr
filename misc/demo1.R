library(xprmntr)
library(magrittr)


resources <- file.path(system.file("extdata", package = "rainbowr"))
images <- c("bisexual.svg", "trangender.svg", "rainbow.svg")

fixation <- trial(
  type = "html-keyboard-response",
  stimulus = '<div style="font-size:60px;">+</div>',
  choices =  unquote("jsPsych.NO_KEYS"),
  trial_duration = 500
)

test <- trial(
  type = "image-keyboard-response",
  stimulus = use_variable('stimulus'),
  prompt = "Do you like this flag? ('y' or 'n')",
  choices = c('y', 'n')
)

test_procedure <- timeline(fixation, test) %>%
  with_variable(name = "stimulus", values = resource(images))
# %>% with_parameters(randomize_order = TRUE, repetitions = 2)


# make experiment handles both jsPsych.init and write
make_experiment(
  timeline = test_procedure,
  path = "~/Desktop/expt",
  resources = resources,
  default_iti = 250,
  on_finish = unquote("xprmntr.save_locally")
)

#run_locally("~/Desktop/expt")

# %>%
#   add_trial(
#     type = "survey-likert",
#     questions = list(list(
#       prompt = "How much did you enjoy this?",
#       labels = c("a lot", "not much", "not at all"),
#       required = TRUE
#     ))
#   )
