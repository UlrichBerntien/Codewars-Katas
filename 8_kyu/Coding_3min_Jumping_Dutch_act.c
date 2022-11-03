#define __STDC_WANT_LIB_EXT2__ 1
#include <stdlib.h>
#include <string.h>

// Returning funny string: Jumping Dutch act.
// Caller must free the returned memory.
char* sc(const int n)
{
  if( n <= 1 ) return strdup("");
  char *const accu = malloc((n+1)*4);
  char* dest = accu;
  for( int i = 1; i < n; ++i, dest+=4 )
    memcpy(dest, "Aa~ ", 4);
  if( n > 6 )
    memcpy(dest, "Pa!", 4);
  else
    memcpy(dest, "Pa! Aa!", 8);
  return accu;
}
