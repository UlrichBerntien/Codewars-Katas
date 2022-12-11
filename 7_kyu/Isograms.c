#include <assert.h>
#include <ctype.h>
#include <stdbool.h>
#include <string.h>
#include <stdint.h>

// Checks i the string cotains a isogram.
// Ignores letter case; "aA" is no isogram.
bool IsIsogram (const char string []) 
{
  // Null pointer argument
  if( string == 0 )
    return true;
  // Map of all used character so far
  assert( sizeof (char) <= 1 );
  uint8_t used [0x100];
  memset(used, 0, sizeof used);
  for( size_t i = 0; string[i]; ++i ) {
    uint8_t *const u = used + tolower(string[i]);
    if( *u )
      return false;
    *u = 1;
  }
  // No chars double used in the string
  return true;
}
