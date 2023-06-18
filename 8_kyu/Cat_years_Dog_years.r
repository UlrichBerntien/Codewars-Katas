# Convert human years to tuple human, cat and dog years.
human_years_cat_years_dog_years <- function(human_years) {
  if( human_years <= 1 )
      return( c(1, 15, 15)*human_years )
  if( human_years <= 2 )
      return( c(human_years, 15+9*(human_years-1), 15+9*(human_years-1)) )
  c(human_years, 24+4*(human_years-2), 24+5*(human_years-2))
}
