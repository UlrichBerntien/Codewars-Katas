#include <stddef.h>

// Returns sum of all positive items.
int positive_sum(const int values [], const size_t count)
{
  int accu = 0;
  for( size_t i = 0; i < count; ++i )
      accu += values[i] > 0 ? values[i] : 0;
  return accu;
}
