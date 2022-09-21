#include <ctype.h>
#include <stdlib.h>
#include <string.h>

// Collects all letters in the string in reverse order.
// Caller must free the returnded string.
char *reverse_letter(const char str[])
{
  // String chars + terminating 0. 
  const size_t str_n = strlen(str) + 1;
  // Allocate maximal needed buffer size
  char *const buffer = malloc(str_n);
  size_t dst = 0;
  for( size_t src = str_n; src > 0; )
  {
    const char c = str[--src];
    if( isalpha(c) )
      buffer[dst++] = c;
  }
  // Terminate string
  buffer[dst] = 0;
  return buffer;
}
