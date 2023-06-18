# Returns TRUE if the distance (in miles) can be reached with fuel (in gallons) and mpg (miles per gallon)
zero_fuel <- function(distance, mpg, fuel) distance <= fuel*mpg
