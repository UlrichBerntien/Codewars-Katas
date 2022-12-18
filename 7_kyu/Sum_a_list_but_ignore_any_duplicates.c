#include <stdlib.h>
#include <string.h>

// Compare function for qsort.
static int int_comp(const void* a, const void* b) {
  return *(const int*) a - *(const int*) b;
}

// Adds all numbers which are only once in the array.
int sum_no_duplicates(const size_t length, const int array[length]) {
  // Handle empty argument
  if( length == 0 || array == 0)
    return 0;
  // Prepare sorted copy of the array
  int *const sorted = calloc(length, sizeof (int));
  memcpy(sorted, array, length * sizeof (int));
  qsort(sorted, length, sizeof (int), int_comp);
  // Add the integers without duplicated integers
  int accu = 0;
  for( size_t i = 0; i < length; ++i ) {
    if( i == length-1 || sorted[i] != sorted[i+1] ) {
      // add single integer
      accu += sorted[i];
    } else {
      // skip multiples
      while( i < length-1 && sorted[i] == sorted[i+1] )
        ++i;
    }
  }
  free(sorted);
  return accu;
}
