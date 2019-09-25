library(xprmntr)


# define trial events -----------------------------------------------------

# define a welcome trial
welcome <- trial_html_key(
  "Welcome to the experiment! Press any key to continue",
)

# define a fixation trial
fixation <- trial_html_key(
  stimulus = '<div style="font-size:60px;">+</div>',
  choices = no_key(),
  trial_duration = 500
)

# define a test trial
query <- trial_image_key(
  stimulus = variable("stimulus"),
  prompt = variable("prompt"),
  choices = c("y","n")
)

# define a survey question
likert1 <- question_likert(
  prompt = "How confident were you in your answers?",
  labels = c("very unsure", "somewhat unsure", "somewhat sure", "very sure"),
  required = TRUE
)

# define a survey question
likert2 <- question_likert(
  prompt = "How bored were you in this experient?",
  labels = c("not at all bored", "somewhat bored", "very bored"),
  required = FALSE
)

# define a likert survey page
survey1 <- trial_survey_likert(
  questions = list(likert1, likert2),
  preamble = "We have some questions"
)

# define a survey question
multi1 <- question_multi_choice(
  prompt = "What gender are you?",
  options = c("male", "female", "non-binary", "other"),
  required = FALSE
)

# define a survey question
multi2 <- question_multi_choice(
  prompt = "Do you identify as LGBTIQ?",
  options = c("yeah", "nah"),
  required = FALSE
)

# define a likert survey page
survey2 <- trial_survey_multi_choice(
  questions = list(multi1, multi2),
  preamble = "We have some more questions"
)


# define an end of experiment trial
finish <- trial_html_key("All done!")



# organise into a structure -----------------------------------------------

flag_names <- c("bisexual", "transgender", "LGBT")
flag_files <- c("bisexual.svg", "transgender.svg", "rainbow.svg")

# testing procedure is a timeline of fixate/query events
testing <- timeline(fixation, query) %>%
  with_variables(
    prompt = paste("is this the", flag_names, "flag? (y/n)"),
    stimulus = resource(flag_files)) %>%
  with_parameters(randomize_order = TRUE, repetitions = 2)

#  overall procedure
all_events <- timeline(welcome, testing, survey1, survey2, finish)




# write the experiment files ----------------------------------------------

experiment(
  timeline = all_events,
  path = "~/Desktop/expt",
  resources = system.file("extdata", "img", package = "xprmntr"),
  default_iti = 250,
  on_finish = js_code("xprmntr.save_locally")
)




# run the experiment ------------------------------------------------------

if(FALSE) {
  run_locally(
    path = "~/Desktop/expt",
    port = 8000
  )
}
