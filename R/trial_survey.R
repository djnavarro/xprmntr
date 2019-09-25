# post_trial_gap, on_finish, on_start, on_load, data

#' Define a Likert question
#'
#' @param prompt The question
#' @param labels The set of labels to attach to the Likert scale
#' @param required Is this a required question (default = FALSE)
#' @param name A name for the question (if NULL, defaults to Q0, Q1, etc)
#'
#' @export
question_likert <- function(prompt, labels, required = FALSE, name = NULL) {
  drop_nulls(
    js_struct(
      prompt = prompt, labels = labels, required = required, name = name
    )
  )
}

#' Define a multiple choice question
#'
#' @param prompt The question
#' @param options The set of possible answers
#' @param required Is this a required question (default = FALSE)
#' @param horizontal Should the options be laid out horizontally (default = FALSE)
#' @param name A name for the question (if NULL, defaults to Q0, Q1, etc)
#'
#' @export
question_multi_choice <- function(
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



#' Create a survey trial with Likert items
#'
#' @param questions A list of questions generated by survey_question()
#' @param shuffle Should the question order be randomised? (default = FALSE)
#' @param preamble Text to display above the survey items
#' @param scale_width Width of the response scale in pixels (NULL defaults to max)
#' @param button_label Text shown in the button to end the trial (default = "Continue")
#'
#' @export
survey_likert <- function(
  questions,
  shuffle = FALSE,
  preamble = "",
  scale_width = NULL,
  button_label = "Continue"
) {
  drop_nulls(
    trial(
      type = "survey-likert",
      questions = purrr::lift_dl(js_array)(questions),
      randomize_question_order = as.logical(shuffle),
      preamble = as.character(preamble),
      scale_width = scale_width,
      button_label = as.character(button_label)
    )
  )
}


#' Create a survey trial with multiple choice items
#'
#' @param questions A list of questions generated by survey_question()
#' @param shuffle Should the question order be randomised? (default = FALSE)
#' @param preamble Text to display above the survey items
#' @param button_label Text shown in the button to end the trial (default = "Continue")
#'
#' @export
survey_multi_choice <- function(
  questions,
  shuffle = FALSE,
  preamble = "",
  button_label = "Continue"
) {
  drop_nulls(
    trial(
      type = "survey-multi-choice",
      questions = purrr::lift_dl(js_array)(questions),
      randomize_question_order = as.logical(shuffle),
      preamble = as.character(preamble),
      button_label = as.character(button_label)
    )
  )
}


