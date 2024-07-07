#include <stddef.h>

/**
 *  Returns smallest integer of array.
 *  array  : Not empty array of integers
 *  len    : length of array
 *  return : minimum of array
 */
int find_smallest_int(const int array[/* len */], size_t len)
{
  // error exit on empty or no array
  if(len == 0 || array == NULL)
    return 0;
  // smallest integer seen so far
  int m = array[0];
  for( size_t i =0; i < len; ++i)
    if(array[i] < m ) m = array[i];
  return m;
}