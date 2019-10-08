library(xprmntr)



# welcome trial -----------------------------------------------------------

welcome_trial <- trial_simple(
  cue = cue_html("Welcome to the experiment! Press any key to continue"),
  response = response_key("any")
)




# choice trials -----------------------------------------------------------

# define a fixation trial
fixation <- trial_simple(
  cue = cue_html('<div style="font-size:60px;">+</div>'),
  response = response_key("none"),
  trial_duration = 500
)

# define a test trial
query <- trial_simple(
  cue = cue_image(stimulus = variable("stimulus")),
  response = response_key("y", "n"),
  prompt = variable("prompt")
)

# define stimuli
flag_names <- c("bisexual", "transgender", "LGBT")
flag_files <- c("bisexual.svg", "transgender.svg", "rainbow.svg")

# testing procedure is a timeline of fixate/query events
choice_trials <- timeline(fixation, query) %>%
  with_variables(
    prompt = paste("is this the", flag_names, "flag? (y/n)"),
    stimulus = resource(flag_files)) %>%
  with_parameters(randomize_order = TRUE, repetitions = 2)



# likert survey -----------------------------------------------------------

# define some response scale
confidence <- c("very unsure", "somewhat unsure", "somewhat sure", "very sure")
boredom <- c("not at all bored", "somewhat bored", "very bored")

# define a survey question
likert_confidence <- question(
  cue = cue_text("How confident were you in your answers?"),
  response = response_likert(labels = confidence),
  required = TRUE
)

# define a survey question
likert_bored <- question(
  cue = cue_text("How bored were you in your answers?"),
  response = response_likert(labels = boredom),
  required = FALSE
)

# compose a likert survey
survey_likert <- trial_survey(
  questions = list(likert_confidence, likert_bored),
  preamble = "We have some questions"
)



# pick one survey ---------------------------------------------------------

# define a survey question
pickone_gender <- question(
  cue = cue_text("What gender are you?"),
  response = response_pickone(
    options = c("male", "female", "non-binary", "other")
  ),
  required = FALSE
)

# define a survey question
pickone_identity <- question(
  cue = cue_text("Do you identify as LGBTIQ?"),
  response = response_pickone(
    options = c("yes", "no", "maybe")
  ),
  required = FALSE
)

# define a multiple choice survey page
survey_pickone <- trial_survey(
  questions = list(pickone_gender, pickone_identity),
  preamble = "We have some more questions"
)



# pick some survey -----------------`---------------------------------------


# define a survey question
picksome_identities <- question(
  cue = cue_text("Select all that apply"),
  response = response_picksome(
    options = c("lesbian", "gay", "bisexual", "transgender",
                "intersex", "queer", "other")
  ),
  required = FALSE
)

# define a multi select page
survey_picksome <- trial_survey(picksome_identities)



# free text survey --------------------------------------------------------



# define a free text page
survey_freetext <- question(
  cue_text("Anything to add?"),
  response_freetext()
) %>%
  trial_survey()



# finish trial ------------------------------------------------------------

finish_trial <- trial_simple(
  cue_html("All done!"),
  response_key("any")
)




# organise into a structure -----------------------------------------------

all_events <- timeline(
  welcome_trial,
  choice_trials,
  survey_likert,
  survey_pickone,
  survey_picksome,
  survey_freetext,
  finish_trial
)




# write the experiment files ----------------------------------------------

resources <- add_resources(
  system.file("extdata", "img", package = "xprmntr")
)

experiment(
  timeline = all_events,
  path = "~/Desktop/expt",
  resources = resources,
  default_iti = 250,
  on_finish = js_code("xprmntr.save_locally"),
  preload_images = resource(flag_files)
)




# run the experiment ------------------------------------------------------

if(FALSE) {
  run_locally(
    path = "~/Desktop/expt",
    port = 8000
  )
}
