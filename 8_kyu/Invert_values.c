#include <stddef.h>

// Inverts the values in place.
// count: number items ins array values.
void invert (int values[], const size_t count)
{
  for( int i = 0; i < count; ++i )
    values[i] *= -1;
}
