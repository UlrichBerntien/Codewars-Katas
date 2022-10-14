#include <stdbool.h>
#include <math.h>

// Check if num is a "Narcissistic number".
bool narcissistic(int num)
{
  // negative numbers are not supported
  if( num < 0 )
    return false;
  // calculation in floats
  // (float power function is standard and fast)
  double accu = (double) num;
  // split the number into decimal digits
  int digits[3 * sizeof (int)];
  int n_digits = 0;
  while( num > 0 ) {
    digits[n_digits++] = num % 10;
    num /= 10;
  }
  // check the value
  const double p = (double) n_digits;
  for( int i = 0; i < n_digits; ++i ) {
    accu -= pow( (double) digits[i], p );
    if( accu < -0.5 )
      return false;
  }
  return accu < 0.5;
}
