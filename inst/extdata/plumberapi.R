# plumber.R

#* @post /post
function(req) {
  print(req$postBody)
}

#* @assets EXPERIMENTHOME /
list()
