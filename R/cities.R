#' Metadata about cities linked with budapest between 2007 and 2012
#' 
#' @details \code{city} and \code{country} are retrieved from the distinct values in the \code{\link{flights}}
#' dataset. The other variables are from the results of the \code{\link[dismo]{geocode}} function, tapping 
#' into the Google Map api. 
#' 
#' @source http://budapest.satrdays.org/#datavizcompo
#' @format Data Frame with columns
#' \describe{
#' \item{city}{city}
#' \item{country}{country}
#' \item{interpretedPlace}{the locality as interpreted by the Google API. See \code{link[dismo]{geocode}}}
#' \item{longitude}{longitude}
#' \item{latitude}{latitude}
#' \item{xmin}{minimum longitude of the bounding box}
#' \item{xmax}{maximum longitude of the bounding box}
#' \item{ymin}{minimum latitude of the bounding box}
#' \item{ymax}{minimum latitude of the bounding box}
#' \item{uncertainty}{distance from \code{c(lon, lat)} to the farthest corner of the bounding box}
#' }
"cities"