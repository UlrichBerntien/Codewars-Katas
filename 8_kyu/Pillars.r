# Calculates distance between first and last pillar.
# Distance is measured between inner edges of first and last pillar.
# num_of_pillars - Number of pillars
# distance - Distance/m between to pillars
# width - Width/cm of one pillar
# Return - Total inner distance/cm
pillars = function(num_of_pillars, distance, width) {
  # Special case: No pillars to measure a distance
  if (num_of_pillars<2) return(0)
  # Standard case: At least 2 pillars
  (num_of_pillars-1)*distance*100 + (num_of_pillars-2)*width
}
