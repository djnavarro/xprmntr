
# Wrapper functions for the following plugins:
#  - jspsych-survey-likert
#  - jspsych-survey-multi-choice
#  - jspsych-survey-multi-select
#  - jspsych-survey-text
#  - jspsych-survey-form ???

# post_trial_gap, on_finish, on_start, on_load, data



# question functions ------------------------------------------------------


#' Survey questions
#'
#' @param prompt The question to be asked
#' @param labels The set of labels to attach to the Likert scale
#' @param options The set of possible answers to a multiple choice question
#' @param placeholder Placeholder text for a free text response question (default = "")
#' @param rows How many text rows should a free text response box use? (default = 1)
#' @param columns How many text columns should should a free text response box use? (default = 40)
#' @param horizontal Should multiple choice options be laid out horizontally (default = FALSE)
#' @param required Is this a required question? (default = FALSE)
#' @param name A name for the question (if NULL, defaults to Q0, Q1, etc)
#'
#' @name survey_questions
NULL


#' @rdname survey_questions
#' @export
question_likert <- function(prompt, labels, required = FALSE, name = NULL) {
  drop_nulls(
    js_struct(
      prompt = prompt, labels = labels, required = required, name = name
    )
  )
}

#' @rdname survey_questions
#' @export
question_multi <- function(
  prompt, options, required = FALSE, horizontal = FALSE, name = NULL
) {
  drop_nulls(
    js_struct(
      prompt = prompt,
      options = options,
      required = required,
      horizontal = horizontal,
      name = name
    )
  )
}

#' @rdname survey_questions
#' @export
question_text <- function(
  prompt, placeholder = "", required = FALSE, rows = 1, columns = 40, name = NULL
) {
  drop_nulls(
    js_struct(
      prompt = prompt,
      placeholder = placeholder,
      required = required,
      rows = rows,
      columns = columns,
      name = name
    )
  )
}


# trial_survey functions --------------------------------------------------

#' Survey trials
#'
#' @param questions A list of questions
#' @param randomize_question_order Should the question order be randomised? (default = FALSE)
#' @param preamble Text to display above the survey items
#' @param scale_width Width of a Likert response scale in pixels (NULL defaults to max)
#' @param button_label Text displayed on button at the end (default = "Continue")
#' @param required_message Warning shown when a user does not select any option in a required multi-select question
#'
#' @name trial_survey
NULL


#' @rdname trial_survey
#' @export
trial_survey_likert <- function(
  questions,
  randomize_question_order = FALSE,
  preamble = "",
  scale_width = NULL,
  button_label = "Continue"
) {
  drop_nulls(
    trial(
      type = "survey-likert",
      questions = list_to_jsarray(questions),
      randomize_question_order = as.logical(randomize_question_order),
      preamble = as.character(preamble),
      scale_width = scale_width,
      button_label = as.character(button_label)
    )
  )
}

#' @rdname trial_survey
#' @export
trial_survey_multi_choice <- function(
  questions,
  randomize_question_order = FALSE,
  preamble = "",
  button_label = "Continue"
) {
  drop_nulls(
    trial(
      type = "survey-multi-choice",
      questions = list_to_jsarray(questions),
      randomize_question_order = as.logical(randomize_question_order),
      preamble = as.character(preamble),
      button_label = as.character(button_label)
    )
  )
}

#' @rdname trial_survey
#' @export
trial_survey_multi_select <- function(
  questions,
  randomize_question_order = FALSE,
  preamble = "",
  button_label = "Continue",
  required_message = "You must choose at least one response for this question"
) {
  drop_nulls(
    trial(
      type = "survey-multi-select",
      questions = list_to_jsarray(questions),
      randomize_question_order = as.logical(randomize_question_order),
      preamble = as.character(preamble),
      button_label = as.character(button_label)
    )
  )
}

#' @rdname trial_survey
#' @export
trial_survey_text <- function(
  questions,
  randomize_question_order = FALSE,
  preamble = "",
  button_label = "Continue"
) {
  drop_nulls(
    trial(
      type = "survey-text",
      questions = list_to_jsarray(questions),
      randomize_question_order = as.logical(randomize_question_order),
      preamble = as.character(preamble),
      button_label = as.character(button_label)
    )
  )
}




