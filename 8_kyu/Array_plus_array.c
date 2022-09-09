#include <stddef.h>

// Calculates the sum of all elements in a and b.
long arr_plus_arr(const int a[], const int b[], const size_t na, const size_t nb)
{
    long accu = 0L;
    for( size_t i = 0; i < na; ++i )
      accu += a[i];
    for( size_t i = 0; i < nb; ++i )
      accu += b[i];
    return accu;
}
