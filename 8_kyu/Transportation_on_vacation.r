# Returns the cost to rent a car for d days.
rental_car_cost <- function(d){
  # $40 per day
  # more than 3d: $20 discount
  # more than 7d: total $50 discount
  40*d - 20*(d >= 3) - 30*(d >= 7)
}
