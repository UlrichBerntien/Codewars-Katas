#include <stdlib.h>

// Generates map uchar -> int.
// All chars in the string have value 1, the other value 0.
// The caller must free the array.
static unsigned char* ones(const char s[])
{
  unsigned char* buffer = malloc(256);
  for( ; *s; ++s )
    buffer[(unsigned int) *s] = 1;
  return buffer;
}

// Counts the vowels in the string.
size_t get_count(const char *s)
{
  // Generate lockup table only once.
  static unsigned char* is_vowel;
  if( is_vowel == NULL )
    is_vowel = ones("aeiouAEIOU");
  // Check argument
  if( s == NULL )
    return 0;
  // Count the vowels
  size_t count = 0;
  for( ; *s; ++s )
    count += is_vowel[(unsigned int) *s];
  return count;
}
