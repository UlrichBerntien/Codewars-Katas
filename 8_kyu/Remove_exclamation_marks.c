#include <stdlib.h>

// Copy string and remove exclamation marks.
// Arguments:
//    str_in - string to copy.
//    str_out - buffer to hold the filtered copy.
void remove_exclamation_marks( const char *const str_in, char *const str_out) {
  // Handle NULL pointer arguments
  if (str_out == 0)
    return;
  if (str_in == 0) {
    *str_out = 0;
    return;
  }
  // Copy input string without exclamation marks with eos marker
  size_t dst = 0, src = 0;
  char current;
  do {
    current = str_in[src++];
    if (current != '!')
      str_out[dst++] = current;
  } while (current != 0);
  return;
}
