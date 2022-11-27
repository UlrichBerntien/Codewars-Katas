// Calculates BMI and returns weight classes.
// Returns a static string constant. Caller must not free the string.
const char* bmi (const int weight, const double height)
{
  if( weight <= 0 || height <= 0.001 )
    return "argument out of range";
  const double bmi = weight / height / height;
  if( bmi <= 18.5 )
    return "Underweight";
  if( bmi <= 25.0 )
    return "Normal";
  if( bmi <= 30.0 )
    return "Overweight";
  return "Obese";
}
