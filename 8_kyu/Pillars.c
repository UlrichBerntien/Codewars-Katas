long pillars(const int num_of_pillars, const int distance, const int width) {
  // Check range of arguments
  if( num_of_pillars < 2 || distance < 0 || width < 0 )
    return 0L;
  // Calculate distance between first and last pillar
  // |width| distance |width| distance |width| distance ... |width|
  // Convert distance/m into distance/cm by factor 100.
  return 100L * (long) distance * (num_of_pillars-1) + (long) width * (num_of_pillars-2);
}
