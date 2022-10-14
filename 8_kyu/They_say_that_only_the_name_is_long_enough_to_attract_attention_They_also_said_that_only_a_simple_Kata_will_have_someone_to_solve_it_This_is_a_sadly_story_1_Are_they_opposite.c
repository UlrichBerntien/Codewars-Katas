#include <stddef.h>
#include <stdbool.h>

// Returns true if both strings are equal but case is opposite.
// Supports only standard ASCII charset letters. 
bool is_opposite(const char s1[], const char s2[]) {
  // NULL and empty strings exit
  if( s1 == NULL || s2 == NULL || *s1 == 0 || *s2 == 0 )
    return false;
  // Check char by char.
  size_t i = 0;
  while( s1[i] != 0 && s2[i] != 0 ) {
    // Quick exit if not letter case bit is the only difference.
    // ONLY works for standard ASCII letters.
    if( (s1[i] ^ s2[i]) != 0x20 )
      return false;
    i++;
  }
  // ok if end of string reached for both strings.
  return s1[i] == s2[i];
}
