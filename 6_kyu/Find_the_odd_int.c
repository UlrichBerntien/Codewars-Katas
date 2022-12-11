#include <stddef.h>

// Finds the integer occuring odd times in the array.
// ALL other integers are even times in the array.
// Trick: it is a ^ a = 0 and a ^ a ^ b = b.
int find_odd (const size_t length, const int array[length])
{
  int accu = 0;
  for( size_t i = 0; i < length; ++i )
    accu ^= array[i];
  return accu;
}
