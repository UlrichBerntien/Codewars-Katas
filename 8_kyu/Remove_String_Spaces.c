#include <ctype.h>
#include <stdlib.h>
#include <string.h>

// Returns copy of input string without any spaces.
// Caller must free the memory.
char *no_space(const char str_in[] )
{
  // allocate buffer to hold the maximal strings length
  char *const buffer = malloc( strlen(str_in) +1 );
  char* out = buffer;
  for( const char* in = str_in; *in; ++in )
    if( ! isspace(*in) )
      *out++ = *in;
  *out = '\0';
  return buffer;
}
