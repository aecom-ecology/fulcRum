
#' Get all the field keys for a given Fulcrum form
#'
#' Use this function to return the unique field keys for every field
#' in a Fulcrum form. Field keys are required to send PUT/POST requests
#' back to Fulcrum
#'
#' @param form_id The form ID of the Fulcrum form
#' @return A `tibble()` containing the field keys, names and data labels
#'
#' @export

get_field_keys<-function(form_id){

  res<-GET(url = paste0("https://web.fulcrumapp.com/api/v2/forms/", form_id, ".json"),
           add_headers("X-ApiToken" = fulcRum::get_api_key()),
           accept_json())

  results<-fromJSON(content(res, "text"))


  extract_key <- function(x, .xname) .xname %in% c("key")
  extract_label <- function(x, .xname) .xname %in% c("label")
  extract_dataname <- function(x, .xname) .xname %in% c("data_name")

  r1 <- rrapply(results, extract_key, c, how = "flatten")
  r2 <- rrapply(results, extract_label, c, how = "flatten")
  r3 <- rrapply(results, extract_dataname, c, how = "flatten")

  dat<-cbind(r1, r2, r3)
  dat<-as_tibble(apply(dat, 2, unlist))
  names(dat)<-c("key", "label", "data_name")

  return(dat)

}
