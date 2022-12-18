#include <sys/types.h>

// Calculates leading part of the decimal number n which is a multiple of three.
// Returns -1 if no leading part of the decimal number is a multiple of 3.
ssize_t prev_mult_of_three(ssize_t n) {
  while (n > 0 && n % 3 != 0 )
    n /= 10;
  return n > 0 ? n : -1;
}
