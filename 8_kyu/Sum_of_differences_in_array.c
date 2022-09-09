#include <stddef.h>

// Calculate width of the array.
// Distance between biggest and smallest value.
int diffsum(const int arr [], const size_t n)
{
  // Argument check
  if( n < 1 || arr == NULL)  
    return 0;
  // min, max of the values
  int min = arr[0];
  int max = arr[0];
  for( size_t i = 1; i < n; ++i )
    if( min > arr[i] )
      min = arr[i];
    else if ( max < arr[i] )
      max = arr[i];
  // Calculate width of the data
  return max - min;
}
