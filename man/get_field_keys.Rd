% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_field_keys.R
\name{get_field_keys}
\alias{get_field_keys}
\title{Get all the field keys for a given Fulcrum form}
\usage{
get_field_keys(form_id)
}
\arguments{
\item{form_id}{The form ID of the Fulcrum form}
}
\value{
A `tibble()` containing the field keys, names and data labels
}
\description{
Use this function to return the unique field keys for every field
in a Fulcrum form. Field keys are required to send PUT/POST requests
back to Fulcrum
}
