#include <string.h>

// Reverse an array recursively.
// Reverses the array in place, NO allocation of memory.
// Training restriction: It must be a recurse function.
int* revR (int array [], int n) {
  if( array == NULL || n <= 1 ) {
    // Empty array or one item in the list -> nothing to do.
    return array;
  }
  const int head = array[0];
  memcpy(array, array+1, (n-1)*sizeof (int));
  revR(array, n-1);
  array[n-1] = head;
  return array;
}
