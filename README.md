
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

Simple example that implements a variation of demo 2 from the `jspsych`
library examples.

``` r
library(xprmntr)
library(magrittr)

# vector of file paths to the resources to be included
img <- c("rainbow.svg", "transgender.svg", "bisexual.svg")
img <- file.path(system.file("extdata", package = "rainbowr"), img)

# create an experiment
tl <- tl_new(resources = img) %>%
  tl_add(
    type = "image-keyboard-response", 
    stimulus = resource(img),
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
```

Write self-contained experiment to a directory:

``` r
jspsych_write(xpt, "~/Desktop/expt")
```

To run the experiment:

``` r
xprmntr::run_locally("~/Desktop/expt")
```
