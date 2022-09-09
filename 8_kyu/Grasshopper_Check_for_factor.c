#include <stdbool.h>

// Returns true if factor is a factor of base.
bool check_for_factor(const int base, const int factor) {
  return base % factor == 0;
}
