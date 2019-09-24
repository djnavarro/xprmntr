
<!-- README.md is generated from README.Rmd. Please edit that file -->

# xprmntr

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/xprmntr)](https://cran.r-project.org/package=xprmntr)
<!-- badges: end -->

The goal of `xprmntr` (pronounced: “experimenter”) is to let users build
behavioural experiments in R run through the browser. Initially, the
intention is to provide wrappers to the
[jspsych](https://www.jspsych.org/) javascript library.

## Installation

The development version can be installed from
[GitHub](https://github.com/) with:

    # install.packages("devtools")
    devtools::install_github("djnavarro/xprmntr")

## Example

``` r
library(magrittr)
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
```

Write self-contained experiment to a directory:

``` r
make_experiment(
  timeline = experiment,
  path = "~/Desktop/expt",
  resources = resources,
  default_iti = 250,
  on_finish = code("xprmntr.save_locally")
)
```

To run the experiment:

``` r
run_locally("~/Desktop/expt")
```
