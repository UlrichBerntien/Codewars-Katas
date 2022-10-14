#include <limits.h>

// Return b with b > 0 and (int)(a+b) == 123
long long int123(const int a) {
  return UINT_MAX + 1L + 123L - a;
}
