# Returns next traffic light color name.
update_light <- function(current) traffic_light_next[current][[1]]

# Definition of the traffic light sequence.
#   name is the current traffic light.
#   value is the next traffic light color.
traffic_light_next = c(green='yellow', yellow='red', red='green')
