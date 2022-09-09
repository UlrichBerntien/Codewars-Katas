#include <stdlib.h>
#include <stdio.h>

// Support up to 15 digits, up to 4 byte integers.
const size_t MAX_DIGITS = 15;

// Convert number to decimal in string.
// Caller must free the memory.
char *number_to_string(const int number) {
  char *const buffer = malloc(MAX_DIGITS+1);
  snprintf(buffer, MAX_DIGITS+1, "%d", number);
  return buffer;
}
