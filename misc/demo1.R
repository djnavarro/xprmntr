library(xprmntr)
library(magrittr)

img <- c("rainbow.svg", "transgender.svg", "bisexual.svg")
img <- file.path(system.file("extdata", package = "rainbowr"), img)
prp <- "Do you like this flag? (Y or N)"
chc <- c(89, 78)

# create an experiment with three trials
xpt <- jspsych_create() %>%
  jspsych_add(type = "image-keyboard-response", stimulus = img[1], prompt = prp, choices = chc) %>%
  jspsych_add(type = "image-keyboard-response", stimulus = img[2], prompt = prp, choices = chc) %>%
  jspsych_add(type = "image-keyboard-response", stimulus = img[3], prompt = prp, choices = chc) %>%
  jspsych_init(default_iti = 250)

# write it to an html file
jspsych_write(xpt, "~/Desktop/expelllr")

