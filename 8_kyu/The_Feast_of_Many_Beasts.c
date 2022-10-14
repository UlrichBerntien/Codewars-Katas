#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

// Gets last char of a string or 0 if string is empty
char lastChar( const char* str ) {
  // NULL pointer error
  if( str == NULL )
    return 0;
  // empty string
  if( *str == 0 )
    return 0;
  // goto string end marker
  while( *str != 0 ) str++;
  // last char is one char before end marker
  return str[-1];
}

// Returns true if and only if the two strings have same start and end char.
bool feast(const char beast[], const char dish[]) {
  // NULL pointer error exit
  if( beast == NULL || dish == NULL )
    return false;
  // first and last char must be the same
  return *beast == *dish && lastChar(beast) == lastChar(dish);
}
