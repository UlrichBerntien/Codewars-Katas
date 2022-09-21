#include <stddef.h>


// Fast calculation of base**exp by squaring.
static inline int int_pow (int base, int exp)
{
  int accu = 1;
  while( exp > 0 ) {
    if( exp & 1 )
      accu *= base;
    if( exp >>= 1 )
      base *= base;
  }
  return accu;
}


// Calculates n-th power of n-th element.
// Returns array[n] ** n
int index (const int array[], const int size, const int n)
{
  if( array == NULL || n < 0 || n >= size )
    return -1;
  return int_pow(array[n],n);
}
