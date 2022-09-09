#include <stddef.h>

// Transform string "digits"  into string "buffer".
// Replaces all <'5' by '0' all others by '1'.
void fakeBin(const char digits [], char buffer []) {
  size_t index = 0;
  for( ; digits[index]; ++index )
    buffer[index] = digits[index] < '5' ? '0' : '1';
  buffer[index] = '\0';
}
