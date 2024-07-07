#include <stddef.h>

/**
 *  Combines 2 strings, returned string has '0' if the chars are not the same, otherwise the char of the strings.
 *  s1 : first input ASCIIZ string.
 *  s2 : second input ASCIIZ string
 *  s3 : buffer to load the result ASCIIZ in.
 *       The length of the buffer is at least the length of s1 and s2.
 */
void neutralize (const char *s1, const char *s2, char *s3)
{
  // error exit on missing any argument string
  if(!s1 | !s2 | !s3 ) return;
  size_t i = 0;
  // loop while end of input string s1 or s2 reached
  for( ;s1[i] && s2[i]; ++i )
    s3[i] = s1[i] == s2[i] ? s1[i] : '0';
  // terminate returned string s3
  s3[i] = 0;
}