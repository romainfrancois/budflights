library("readxl")
library("dplyr")

tmp <- tempfile( fileext = ".xlsx")
download.file( "http://budapest.satrdays.org/data/BUD%20flights%202007-2012%20v2.xlsx", tmp )
data <- read_excel(tmp)

# tidy the data from the excel file
flights <- data %>% 
  `names<-`( casefold(gsub( " ", "_", names(data))) ) %>%
  rename( direction = fligh_direction, type = flight_type ) %>%
  mutate( year = date_year, month = as.numeric(substr(date_year_month, 5, 6)) ) %>%
  group_by( year, month, country, city, direction ) %>%
  summarise( passengers            = sum(nbr_of_passengers), 
             weight                = sum(cargo_weight), 
             capacity              = sum(seat_capacity), 
             flights               = sum(nbr_of_flights), 
             scheduled             = sum(nbr_of_flights[type == "Scheduled"] ), 
             non_scheduled         = flights - scheduled, 
             flights_no_passengers = sum( nbr_of_flights[nbr_of_passengers==0] ), 
             flights_no_weight     = sum( nbr_of_flights[cargo_weight==0] ), 
             flights_empty         = sum( nbr_of_flights[nbr_of_passengers==0 & cargo_weight==0 ]), 
             filling               = passengers / capacity
             ) %>%
  arrange( year, month, country, city, direction ) %>%
  ungroup
save( flights, file = "data/flights.rda")

# get metadata about cities
places <- with( distinct( flights, city, country ), paste(city, country, sep = ", ") )

# avoid explicitely loading dismo which breaks select
geocode <- dismo::geocode

p <- progress_estimated(length(places))
coords <- tbl_df( bind_rows( lapply(places, function(place){
  res <- geocode( place )[1, ] 
  Sys.sleep( .2 ) # otherwise geocode wont let us get all the data
  p$tick()$print()
  res
}) ) ) 
cities <- flights %>% 
  distinct( city, country ) %>%
  bind_cols(coords) %>% 
  select( -originalPlace ) %>%
  arrange( country )
save( cities, file = "data/cities.rda")


