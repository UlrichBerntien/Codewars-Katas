#include <stddef.h>
#include <math.h>

// Calculates Mean square error between a and b.
// Arguments:
//    n - Number of items in the both arrays
//    a,b - Equal size interger arrays
// Return:
//    Mean of (a[i]-b[i])² 
double mean_square_error(const size_t n, const int a[n], const int b[n])
{
  // Empty argument / Null arguments
  if( n == 0 || a == NULL ||b == NULL )
    return 0.0;
  long double accu = 0.0;
  for( size_t i = 0; i < n; ++i ) {
    const double delta = (double) a[i] - (double) b[i];
    accu += delta * delta;
  }
  return accu / (double) n;
}
