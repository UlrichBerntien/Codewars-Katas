#include <inttypes.h>

// Returns maximal N = a * d with n = a + d and a != d.
// Returns -1 if n < 5
int64_t max_int_chain(const int64_t n) {
  if( n < 5 )
    return -1;
  const int64_t a = (n-1)/2;
  const int64_t b = n-a;
  return a*b;
}
