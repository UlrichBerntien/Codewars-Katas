#include <stddef.h>

// Returns the sum of the values[first..length-1] of the array.
static long long sum(const int values[], const int first, const int length) {
  long long accu = 0;
  for( int i = first; i < length; ++i )
    accu += values[i];
  return accu;
}

// Calculates index J so that sum(values[0..J-1]) == sum(values[J+2..])
// The element with index J is not part a sum. Empty sum are allowed.
// Returns -1 of not exists, returns smallest index if more than one J exists.
int find_even_index(const int values[], const int length) {
  if( length < 1 || values == NULL ) {
    // Invalid parameters
    return -1;
  }
  int j = 0;
  long long sumLeft = 0;
  long long sumRight = sum( values, j+1, length );
  while( j < length ) {
    if( sumLeft == sumRight ) return j;
    sumLeft += values[j++];
    sumRight -= values[j];
  }
  return -1;
}
