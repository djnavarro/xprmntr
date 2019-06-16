
<!-- README.md is generated from README.Rmd. Please edit that file -->

# xprmntr

<!-- badges: start -->

<!-- badges: end -->

The goal of `xprmntr` is to let users build behavioural experiments in R
run through the browser. Initially, the intention is to provide wrappers
to the [jspsych](https://www.jspsych.org/) javascript library.

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

# stimuli, prompt, response options
img <- file.path(
  system.file("extdata", package = "rainbowr"),
  c("rainbow.svg", "transgender.svg", "bisexual.svg"))
txt <- "Do you like this flag? (Y or N)"
opt <- c(89, 78)

# create an experiment with three trials
xpt <- xpt_create() %>%
  xpt_image_keyboard_response(stimulus = img[1], choices = opt, prompt = txt) %>%
  xpt_image_keyboard_response(stimulus = img[2], choices = opt, prompt = txt) %>%
  xpt_image_keyboard_response(stimulus = img[3], choices = opt, prompt = txt)
```

To

``` r
xpt_write(xpt, "~/Desktop/expt.html")
```
