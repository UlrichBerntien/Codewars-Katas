# Returns quarter 1,2,3 or 4 of the month.
quarter_of <- function(month){
  if( !(1 <= month && month <= 12) )
    stop("argument month out or range")
  (month+2) %/% 3
}
