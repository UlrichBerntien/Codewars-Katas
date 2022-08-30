#include <stddef.h>

// Counts occurence of letter in str.
size_t str_count(const char str[], const char letter)
{
  size_t counter = 0;
  const char* ptr = str;
  while( *ptr )
    if( *ptr++ == letter )
      counter++;
  return counter;
}