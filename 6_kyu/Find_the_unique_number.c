#include <assert.h>
#include <stddef.h>

// Returns the unique number in the array.
// All other numbers are equal.
float finduniq(const float nums[], const size_t n)
{
  assert( nums != NULL && n > 2 );
  // Start with estimation first number is the common number
  float common = nums[0];
  if( nums[1] != common )
  {
    // first or second number is not the common number
    if( nums[2] == common )
      return nums[1];
    else
      return nums[0];
  }
  // Now common is verified the common number.
  // Search the other number.
  for( size_t i = 2; i < n; ++i )
    if( nums[i] != common )
      return nums[i];
  // No unique number found
  return common;
}
