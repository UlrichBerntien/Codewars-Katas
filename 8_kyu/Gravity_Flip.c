#include <stddef.h>
#include <stdlib.h>
#include <string.h>

// Compare function to sort integers descending.
static int comp_int_desc (const void* a, const void* b)
{
  return *(const int*) b - *(const int*) a;
}

// Compare function to sort integers ascending.
static int comp_int_asc (const void* a, const void* b)
{
  return *(const int*) a - *(const int*) b;
}

// Sorts array of integers.
// Arguments:
//  d - direction 'R': ascending, 'L': descending
//  array - integers to sort
//  n - number of items in the array
//  result - buffer to store the sorted integers
void flip(const char d, const int array [], const size_t n, int result [])
{
  // parameter check
  if( array == NULL || n == 0 || result == NULL)
    return;
  memcpy(result, array, n * sizeof (int));
  qsort(result, n, sizeof (int), d == 'L' ? comp_int_desc : comp_int_asc );
}
