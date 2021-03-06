
<!-- README.md is generated from README.Rmd. Please edit that file -->

# xprmntr

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/xprmntr)](https://cran.r-project.org/package=xprmntr)
<!-- badges: end -->

The goal of `xprmntr` (pronounced: “experimenter”) is to let users build
behavioural experiments in R run through the browser, by providing
wrappers to the [jspsych](https://www.jspsych.org/) javascript library.

## Installation

The development version can be installed from
[GitHub](https://github.com/) with:

    # install.packages("devtools")
    devtools::install_github("djnavarro/xprmntr")

## Goals

The jsPsych library is organised around a system of *plugins* that
generate specific trial types that can be used in a behavioural
experiment. The initial goals in xprmtnr is:

  - To provide “general purpose” wrappers that can be used to insert
    *any* jsPsych plugin (including any novel plugin)
  - To provide a convenient API that wraps around the “standard” plugins
    that come bundled with jsPsych, and provides some structure for the
    user
  - To allow the client side experiment (jsPsych) to communicate with an
    R server using the plumber package so the experiment can call
    server-side R functions
  - To allow experiments to deploy locally, or github pages, etc.
  - To provide mechanisms to save locally, or to dropbox or similar
    cloud storage

## Notes

  - The “survey” family:
      - jspsych-survey-html-form
      - jspsych-survey-likert
      - jspsych-survey-multi-choice
      - jspsych-survey-multi-select
      - jspsych-survey-text
  - The “sr” family (stimulus-response):
      - jspsych-audio-button-response
      - jspsych-audio-keyboard-response
      - jspsych-audio-slider-response
      - jspsych-html-button-response
      - jspsych-html-keyboard-response
      - jspsych-html-slider-response
      - jspsych-image-button-response
      - jspsych-image-keyboard-response
      - jspsych-image-slider-response
      - jspsych-video-button-response
      - jspsych-video-keyboard-response
      - jspsych-video-slider-response
  - The “categorise” family:
      - jspsych-categorize-animation
      - jspsych-categorize-html
      - jspsych-categorize-image
  - Other… not sure yet
      - jspsych-animation
      - jspsych-cloze
      - jspsych-free-sort
      - jspsych-iat-html
      - jspsych-iat-image
      - jspsych-rdk
      - jspsych-reconstruction
      - jspsych-resize
      - jspsych-same-different-html
      - jspsych-same-different-image
      - jspsych-serial-reaction-time
      - jspsych-serial-reaction-time-mouse
      - jspsych-visual-search-circle
      - jspsych-vsl-animate-occlusion
      - jspsych-vsl-grid-scene
  - “Meta???” family (not strictly “trials”)
      - jspsych-external-html
      - jspsych-call-function
      - jspsych-fullscreen
      - jspsych-instructions
      - possibly have wrappers for loop nodes & conditional nodes here??

## Possible design:

  - the “cue” family is used to specify the stimulus (broadly construed)
      - cue\_html
      - cue\_text
      - cue\_image
      - cue\_audio
      - cue\_video
      - cue\_animation
  - the “response” family is used to specify a response mechanism
      - response\_button
      - response\_key
      - response\_slider (continuous)
      - response\_likert (ordinal)
      - response\_select (radio or checkbox)
      - response\_mouse (???)
      - response\_text (free text??)p
  - the “simple” family is a simple construction
  - the “survey” family: the trial is built from multiple questions; a
    question is a combination of a display\_text + response\_likert +
    response\_select …
  - the “iat”, “same-diff”, “categorise” seem like they could be made to
    fit this framework easily
