#' Load your Fulcrum API key from file
#'
#' This function is to help obscure the API key, and prevent it showing up in
#' logs or accidentally being distributed. The function expects the file to
#' already be in .RData format. Do not assign the output of this function to a
#' variable because that will defeat the point of putting the key into a
#' function in the first place.
#'
#' @param key_location File location of your API key in .RData format
#' @return API key in plain text to be passed to the API query functions
#'
#' @export


get_api_key <- function(key_location){
  key<-readRDS(key_location)
}
