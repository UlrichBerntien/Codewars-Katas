#include <stdlib.h>
#include <string.h>
#include <ctype.h>

// Converts words into one camelCaseWord.
// Returns a new string, caller must free the memory.
char* camel_case(const char *const s)
{
  // allocate enough buffer to store the maximal length
  char *const buffer = malloc( strlen(s)+1 );
  // pointers to read the input and store the output
  const char* src = s ? s : "";
  char* dst = buffer;
  while( *src != 0 ) {
    // skip spaces
    while( isspace(*src) )
      ++src;
    // first letter of the word to upper case
    if( *src )
      *dst++ = toupper(*src++);
    // rest of the current word to lower case
    while( *src != 0 && !isspace(*src) )
      *dst++ = tolower(*src++);
  }
  // terminate string
  *dst = 0;
  return buffer;
}
