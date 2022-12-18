// Duration in
// - human year
// - cat years
// - dog years
typedef struct Human_Cat_Dog_Years
{
  unsigned human_years, cat_years, dog_years;
} years;

// Converts y by the constants c.
static unsigned convert ( const unsigned y, const unsigned c[3] )
{
  switch( y ) {
      case 0 :
        return 0;
      case 1 :
        return c[0];
      case 2 :
        return c[0] + c[1];
      default :
        return c[0] + c[1] + (y-2) * c[2];
  }
}

// Calculate cat years and dog years.
years human_years_cat_years_dog_years(const unsigned human)
{
  // Constants to convert years
  static const unsigned cat_c [3] = {15, 9, 4};
  static const unsigned dog_c [3] = {15, 9, 5};
  // Caclculate the years
  const years result = {
    .human_years = human,
    .cat_years = convert( human, cat_c ),
    .dog_years = convert( human, dog_c ) };
  return result;
}
