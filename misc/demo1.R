library(xprmntr)
library(magrittr)

img <- c("rainbow.svg", "transgender.svg", "bisexual.svg")
img <- file.path(system.file("extdata", package = "rainbowr"), img)
prp <- "Do you like this flag? (Y or N)"
chc <- c(89, 78)

# create an experiment with three trials
xpt <- jspsych_create(files = img) %>%
  jspsych_add(type = "image-keyboard-response", stimulus = res("rainbow.svg"), prompt = prp, choices = chc) %>%
  jspsych_add(type = "image-keyboard-response", stimulus = res("transgender.svg"), prompt = prp, choices = chc) %>%
  jspsych_add(type = "image-keyboard-response", stimulus = res("bisexual.svg"), prompt = prp, choices = chc) %>%
  jspsych_init(default_iti = 250)

# write it to an html file
jspsych_write(xpt, "~/Desktop/expelllr")

