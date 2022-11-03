#include <stddef.h>
#include <string.h>

// Count the number of Smily ":) :D ;-D :~)" in the strings.
size_t count_smileys(const size_t length, const char *const array[length]) {
  size_t counter = 0;
  for( size_t i = 0; i < length; ++i ) {
    const char* ptr = array[i];
    // Check eyes
    if( *ptr != ':' && *ptr != ';' )
      continue;
    if( *++ptr == 0 )
      continue;
    // Noses are optional
    if( *ptr == '-' || *ptr == '~' )
      ++ptr;
    // Check mouth
    if( (*ptr == ')' || *ptr == 'D') && ptr[1] == 0 )
      ++counter;
  }
  return counter;
}
