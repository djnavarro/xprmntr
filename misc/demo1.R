library(xprmntr)
library(rainbowr)
library(magrittr)

# paths to images
images <- c(
  system.file("extdata", "rainbow.svg", package = "rainbowr"),
  system.file("extdata", "transgender.svg", package = "rainbowr"),
  system.file("extdata", "bisexual.svg", package = "rainbowr")
)

# prompt to the user
prompt <- "Do you like this flag? (Y or N)"

# response options
choices <- c(89, 78) # Y or N

# build a simple experiment
expt <- xpt_create() %>%
  xpt_image_keyboard_response(stimulus = images[1], choices = choices, prompt = prompt) %>%
  xpt_image_keyboard_response(stimulus = images[2], choices = choices, prompt = prompt) %>%
  xpt_image_keyboard_response(stimulus = images[3], choices = choices, prompt = prompt) %>%
  xpt_write(file = "~/Desktop/expt.html")

