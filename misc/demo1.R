library(xprmntr)
library(magrittr)

# stimuli, prompt, response options
my_opts <- function(ind) {
  images <- c("rainbow.svg", "transgender.svg", "bisexual.svg")
  return(list(
    stimulus = file.path(system.file("extdata", package = "rainbowr"), images[ind]),
    prompt = "Do you like this flag? (Y or N)",
    choices = c(89, 78)
  ))
}

# create an experiment with three trials
xpt <- jspsych_create() %>%
  jspsych_add(type = "image-keyboard-response", options = my_opts(1)) %>%
  jspsych_add(type = "image-keyboard-response", options = my_opts(2)) %>%
  jspsych_add(type = "image-keyboard-response", options = my_opts(3))

# write it to an html file
jspsych_write(xpt, "~/Desktop/expelllr")

