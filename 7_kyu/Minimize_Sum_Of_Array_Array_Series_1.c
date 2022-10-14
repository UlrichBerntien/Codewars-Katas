#include <stdlib.h>
#include <string.h>


// Duplicates an array.
// Arguments:
//  a - Array to copy.
//  len - Number of items in the array a.
// Return:
//  New array with content of a.
//  Caller must free the memory.
static int* dup(const int a[], const int len)
{
  const size_t size = len * sizeof (int);
  int *const result = malloc(size);
  memcpy(result, a, size);
  return result;
}


// Compare function for qsort.
static int icmp(const void* a, const void* b)
{
  return *(const int*)a - *(const int*)b;
}


// Calculates the minimal sum of pairwise multiplied numbers.
// Works only on non-negative numbers!
// Arguments:
//  passed - Array of numbers to multiply and add.
//  passed_size - Number of items in the array passed.
// Return:
//  Minimal sum of pairwise multiplied numbers.
int minSum(const int passed[], const int passed_size)
{
  // null argument return
  if( passed == NULL || passed_size == 0 )
    return 0;
  // create a copy of the array,
  // keep the original data unchanged
  int *const sorted = dup(passed, passed_size);
  // Algorithm: multiplay the smallest and biggest number to minimize the sum.
  qsort(sorted, passed_size, sizeof (int), &icmp);  
  int accu = 0;
  for( int i=0, j=passed_size-1; i < j; ++i,--j )
    accu += sorted[i]*sorted[j];
  free(sorted);
  return accu; 
}
