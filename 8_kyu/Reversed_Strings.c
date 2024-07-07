#include <string.h>

/*
 *  Revers string in place.
 *  Supports 1-char strings only. No UTF-8 support.
 *  Argument
 *    string = String to reverse, input and ouput
 *  Return
 *    pointer to string
 */
char* strrev (char* string)
{
  // Exit on NULL string or empty string.
  if( !string || !*string )
    return string;
  // reverse string by char to char swapping.
  size_t first = 0;
  size_t last = strlen(string)-1;
  while( first < last ) {
    const char tmp = string[first];
    string[first++] = string[last];
    string[last--] = tmp;
  }
  return string;
}
