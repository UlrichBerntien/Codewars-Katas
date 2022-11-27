#include <stdlib.h>
#include <string.h>

// Generates string by repeation.
// Return:
//  New string, count times the src string.
//  Caller must free the string.
char* repeat_str(const size_t count, const char src [])
{
  const size_t l = strlen(src);
  char *const buffer = malloc( count * l + 1 );
  // out of memory
  if( buffer == NULL )
    return NULL;
  for( size_t i = 0; i < count; ++i )
    memcpy(buffer + i * l, src, l );
  // end of string.
  buffer[count*l] = 0;
  return buffer;
}
