#' Pass a GET query to the Fulcrum Query API
#'
#' Fulcrum uses PostgreSQL on the backend, and so any valid PostgreSQL query can
#' be passed to the API. Save an SQL query in a text file and pass that query to
#' \code{query_fulcrum_api} and, assuming you have a valid API key, the results
#' of the query will be returned in JSON format for further processing in R.
#'
#' This function depends on the \code{httr} library to work.
#'
#' \code{query_fulcrum_api} expects your API key to be input as a .RData file.
#' To convert a plain text string to a .RData file, use
#' \code{\link[readRDS:base]{saveRDS}} from base R.
#'
#' @param query The path to a PostgreSQL query saved in a text file, or the query itself as a string
#' @param api_key API key for your Fulcrum account in .RData format.
#' @param url URL for the query API. Default should be fine.
#' @param format Output format for the query.
#'
#' @return The output of the SQL query from Fulcrum in JSON format.
#' @export

query_fulcrum<- function(query, api_key, url = "https://api.fulcrumapp.com/api/v2/query/", format = "json"){

  if (file.exists(query)){
    message('Reading file...')
    query <- paste(readLines(query), collapse = '\n')

  } else {
    message('Reading query...')
    query <- query
  }
  message('Submitting query...')
  x <- httr::GET(url = url,
                 query = list("token" = api_key,
                              "q" = query,
                              "format" = format))
  return(x)
}
