#include <ctype.h>
#include <string.h>


// Countslower case letters in message.
// This implementation needs ASCII character set!
// Arguments:
//  encryption - the text.
//  key - the array to store the counts as chars, 27 chars length.
//        index in the key is 0 = a, 1 = b, ...
void decrypt(const char encryption [], char key[]) {
  // NULL pointer error exit
  if( encryption == NULL || key == NULL )
    return;
  // initialise key vector, set all counters to 0.
  memset(key, '0', 26);
  key[26] = 0;
  // count the lower letters in the encrypted text
  char c;
  for( const char* src = encryption; (c = *src) != 0; src++ ) {
    if( islower(c) && isalpha(c) )
      key[c-'a']++;
  }
}
