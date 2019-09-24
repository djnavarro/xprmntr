library(xprmntr)

# resource folder
resources <- system.file("extdata", "img", package = "xprmntr")

# variables to use
flag_images <- c("bisexual.svg", "transgender.svg", "rainbow.svg")
flag_names <- c("bisexual", "transgender", "LGBT")

# define a welcome trial
welcome <- trial(
  type = "html-keyboard-response",
  stimulus = "Welcome to the experiment! Press any key to continue",
  choices = code("jsPsych.ANY_KEY")
)

# define a fixation trial
fixation <- trial(
  type = "html-keyboard-response",
  stimulus = '<div style="font-size:60px;">+</div>',
  choices =  code("jsPsych.NO_KEYS"),
  trial_duration = 500
)

# define a test trial
query <- trial(
  type = "image-keyboard-response",
  stimulus = use_variable("stimulus"),
  prompt = use_variable("prompt"),
  choices = c('y', 'n')
)

# nested timelines with repetitions and variables
testing <- timeline(fixation, query) %>%
  with_variables(
    prompt = paste("is this the", flag_names, "flag? (y/n)"),
    stimulus = resource(flag_images)) %>%
  with_parameters(randomize_order = TRUE, repetitions = 2)

# post experimental questionnaire
survey <- trial(
  type = "survey-likert",
  questions = list(list(
    prompt = "How much did you enjoy this?",
    labels = c("a lot", "not much", "not at all"),
    required = TRUE
  ))
)

# define an end of experiment trial
finish <- trial(
  type = "html-keyboard-response",
  stimulus = "All done!",
  choices = code("jsPsych.ANY_KEY")
)

# everything
experiment <- timeline(welcome, testing, survey, finish)

# construct the experiment
make_experiment(
  timeline = experiment,
  path = "~/Desktop/expt",
  resources = resources,
  default_iti = 250,
  on_finish = code("xprmntr.save_locally")
)

run_locally(
  path = "~/Desktop/expt",
  port = 8000
)
