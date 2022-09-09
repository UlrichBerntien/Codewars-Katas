#include <stdbool.h>
#include <stddef.h>

// Checks if the characters in the string are ordered.
// Returns true if all string[i] <= string[j] with i <= j.
bool is_ordered (const char string[] )
{
  if( string == NULL || string[0] == '\0' )
    return true;
  // Check the char pairs
  for( register int i = 1; string[i]; ++i )
    if( string[i-1] > string[i] )
      return false;
  // All chars are orders
	return true;
}
