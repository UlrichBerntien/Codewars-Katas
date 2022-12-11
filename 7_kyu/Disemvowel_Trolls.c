#define __STDC_WANT_LIB_EXT2__ 1
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

// Checks for vowel.
// Returns true if the character is a vowel (aeiou, not y).
static bool is_vowel(const char c) {
  switch(c) {
      case 'a':
      case 'e':
      case 'i':
      case 'o':
      case 'u':
      case 'A':
      case 'E':
      case 'I':
      case 'O':
      case 'U':
        return true;
      default:
        return false;
  }
}

// Filters out all vowels.
// Arguments:
//    str - String to filter.
// Return:
//    Copy of str without vowels.
//    Caller must free the returned string.
char* disemvowel(const char str [])
{
  // special case: null pointer argument
  if( str == NULL )
    return strdup("");
  const size_t l = strlen(str);
  char *const buffer = malloc(l+1);
  // out of memory error
  if( buffer == NULL )
    return buffer;
  size_t dst = 0;
  // Copy all non-vowels and the end of string (0) marker.
  for( size_t src = 0; src <= l; ++src ) {
    const char c = str[src];
    if( ! is_vowel(c) )
      buffer[dst++] = c;
  }
  return buffer;
}
