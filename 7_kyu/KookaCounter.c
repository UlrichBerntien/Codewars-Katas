#include <stddef.h>
#include <string.h>

// Counts the number kooka calls.
size_t kooka_counter (const char* laughing)
{
  // Counter of calls
  size_t counter = 0;
  // Last seen caller "Ha" = 1, "ha" = 2.
  char seen = 0;
  // Parse the whole string
  while( *laughing != 0 ) {
    if( memcmp(laughing,"Ha",2) == 0 ) {
      if( seen != 1 ) {
        // A new caller
        seen = 1;
        ++counter;
      }
      laughing += 2;
    } else if( memcmp(laughing,"ha",2) == 0 ) {
      if( seen != 2 ) {
        seen = 2;
        ++counter;
      }
      laughing += 2;
    } else {
      // No kooka call. Goto next char.
      ++laughing;
    }
  }
  return counter;
}
