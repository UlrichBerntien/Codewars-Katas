# Returns reduced direction array skipping all opposite direction pairs.
dirReduc <- function(arr) {
  result <- list()
  for( it in arr )
    result <-
      if( length(result) == 0 || result[length(result)] != opposite_direction[[it]] )
        append(result, it)
      else
        result[-length(result)]
  unlist(result)
}

# Mapping from direction to opposite direction
# Values are the oppposite direction to the names
opposite_direction <- c(
  "NORTH"="SOUTH",
  "SOUTH"="NORTH",
  "WEST"="EAST",
  "EAST"="WEST" )
