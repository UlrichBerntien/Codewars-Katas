#include <stdlib.h>
#include <string.h>

// Interpret string s with '#' as delete.
// Returned string with interpreted delete operations.
// Caller must free the returned string.
char* strclr(const char s [])
{
  const size_t n  = strlen(s);
  char *const buffer = malloc(n+1);
  size_t dIndex = 0;
  for( size_t sIndex = 0; sIndex <= n; sIndex++ )
    if( s[sIndex] == '#' ) {
      if( dIndex > 0 ) dIndex--;
    } else {
      buffer[dIndex++] = s[sIndex];
    }
  buffer[dIndex] = 0;
  return buffer;
}
