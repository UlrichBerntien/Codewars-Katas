#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

// Calculates "+1", uses array as a number of digits.
// Arguments:
//    arr - The number to inrement, array of digits.
//    *count - Number of items in the input array / output array 
// Return:
//    New array, caller must free it.
int* up_array(const int arr[], unsigned *const count)
{
  // Check arguments. All digits must be checked!
  if( arr == NULL || count == NULL )
    return NULL;
  const unsigned len = *count;
  if( len < 1 )
    return NULL;
  for( unsigned i = 0; i < len; ++i )
    if( arr[i] < 0 || arr[i] > 9 )
      return NULL;
  // Clone the array, keep one item for overflow
  int *const result = malloc( (*count+1) * sizeof (int) );
  memcpy(result, arr, *count * sizeof (int) );
  // Calculate
  bool carry = true;
  for( int i = ((int) len)-1; carry && i >= 0; --i ) {
    carry = (++result[i]) > 9;
    if( carry )
      result[i] -= 10;
  }
  if( carry )
  {
    // one more digit needed
    memmove(result+1, result, *count * sizeof (int));
    result[0] = carry;
    (*count)++;
  }
  return result;
}
