#include <stdbool.h>
#include <stdlib.h>

// Returns true if the number of x and o letters are equal.
// Ignores other characters, compares case insensitive.
// Supports ASCII character set only.
bool xo (const char* str)
{
  // Error exit if NULL pointer argument
  if( str == NULL )
    return true;
  // Count the x and o letters
  size_t x = 0, o = 0;
  for( ; *str; ++str )
  {
    // Convert letters to lower case
    const char c = *str | 0x20;
    if( c == 'x' )
      ++x;
    else if( c == 'o' )
      ++o;
  }
  // Return true if count of x equal count of o.    
  return x == o;
}
