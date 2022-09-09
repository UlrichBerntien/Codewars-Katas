#include <stddef.h>

// Alphabetic addition of all letters.
// Rules: a + a = b, a + b = c, a + z = a.
char add_letters(const size_t n, const char letters[] )
{
  char accu = (n > 0 ? letters[0] : 'z' ) - 'a';
  for( size_t i = 1; i < n; ++i )
    accu = ( accu + letters[i] - 'a' + 1 ) % 26;
  return accu + 'a';
}
