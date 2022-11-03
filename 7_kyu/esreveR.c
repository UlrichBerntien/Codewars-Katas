#include <stddef.h>

// Reverse array of integers.
// Arguments:
//    length - number of items in both arrays
//    array - the array to reverse
//    reversed - allocated memory to store the reversed array
void reverse(const size_t length, const int array[length], int reversed[length]) {
  const size_t last = length-1;
  for( size_t i = 0; i < length; ++i )
    reversed[i] = array[last-i];
}