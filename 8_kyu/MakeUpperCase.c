#include <ctype.h>
#include <string.h>
#include <stdlib.h>

// Returns string in upper case.
// Caller must free the returned string.
char* makeUpperCase (const char string [])
{
  if( string == NULL )
    return NULL;
  const size_t len = strlen(string);
  char *const result = malloc(len+1);
  for( size_t i = 0; i <= len; ++i )
    result[i] = toupper(string[i]);
  return result;
}
