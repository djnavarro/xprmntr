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

# write it to an html file
xpt_write(xpt, "~/Desktop/expt.html")

