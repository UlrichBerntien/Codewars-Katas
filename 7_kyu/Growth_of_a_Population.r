# Calculates number of years until population p is reached (equal or above).
# p0      = start population in year 0
# percent = yearly grow in percentage
# aug     = yearly absolute population change
# p       = polulation to reach
nbYear <- function (p0, percent, aug, p) {
  # Factor including the percentage growth
  f = 1 + percent/100
  # Current year and current population in the loop
  year = 0L
  pYear = p0
  while(pYear < p) {
    year = year + 1L
    # Add relative and absolute yearly grow
    # Round down to an integer value, a population is always multiples of 1.
    pYear = floor(pYear*f + aug)
  }
  return(year)
}
