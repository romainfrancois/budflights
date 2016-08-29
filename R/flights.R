#' Aggregated flights information about flights leaving or arriving budapest
#' 
#' Aggregated flights information about flights leaving or arriving budapest between 2007 and 2012. 
#' The data is originally from the satRday Budapest dataviz contest but has been reorganized slightly :
#' flights are aggregated by city (regardless of the airport) and type (scheduled or non scheduled)
#' 
#' @source http://budapest.satrdays.org/#datavizcompo
#' @format Data Frame with columns
#' \describe{
#' \item{year}{year, from 2007 to 2012}
#' \item{month}{month. Numbers from 1 to 12}
#' \item{country}{country}
#' \item{city}{city}
#' \item{direction}{Incoming (flights arriving budapest), or Outgoing (flights leaving budapest)}
#' \item{passengers}{Total number of passengers}
#' \item{weight}{Total cargo weight}
#' \item{capacity}{Total seat capacity}
#' \item{flights}{Number of flights}
#' \item{scheduled}{number of scheduled flights}
#' \item{non_scheduled}{number of non scheduled flights}
#' \item{flights_no_passengers}{number of flights without any passengers}
#' \item{flights_no_weight}{number of flights carrying no cargo weight}
#' \item{flights_empty}{number of flights without any passengers and no cargo weight}
#' }
#' @examples 
#'   flights
"flights"