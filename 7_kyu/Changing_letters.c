#include <stddef.h>

// Capitalizes all vowels (aeiou) in place.
// Implementation needs ASCII character set.
char *capitalize_vowels( char string [] )
{
  if( string != NULL ) {
    for( size_t i = 0; string[i]; ++i )
      switch(string[i]) {
          case 'a':
          case 'e':
          case 'i':
          case 'o':
          case 'u':
            string[i] &= 0xdf;
      }
  }
	return string;
}
