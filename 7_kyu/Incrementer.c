#include <stddef.h>

// Increments items in an array.
// Adds "index+1" and calculate "mod 10".
// Arguments:
//    dest - allocated array to store the result
//    src - array of integers to increment
//    n - number of items in the arrays
unsigned* incrementer(unsigned dest[], const unsigned src[], const size_t n)
{
  // fast exit on empty/missing input data 
  if( dest == NULL || src == NULL || n == 0 )
    return NULL;
  for( size_t i = 0; i < n; ++i )
    dest[i] = ( src[i] + i + 1 ) % 10;
  return dest;
}
