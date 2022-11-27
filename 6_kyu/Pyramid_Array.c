#include <stdlib.h>

// Generates array of n integer arrays filled with 1.
// [[1], [1,1], [1,1,1], ... [1,...,1]]
int** pyramid (const unsigned n)
{
  // Number of integers to store
  const unsigned n_ints = (n * (n+1))/2;
  // Number of bytes needed for n pointers and n_ints integers
  // plus rounding for memory alignment.
  const size_t n_bytes = (n+1) * sizeof (int*) + n_ints * sizeof (int);
  int **const pointers = malloc(n_bytes);
  // Base address of the integer array
  int *const base = (int*) (pointers + n);
  // Fill all integers with ones.
  for(size_t i = 0; i < n_ints; ++i)
    base[i] = 1;
  // Fill the array of pointers.
  for(unsigned i = 0, j = 0; i < n; j += ++i)
    pointers[i] = base+j;
	return pointers;
}

// Frees the allocated memory.
void free_pyramid (const unsigned n, int *const pyramid_array[n])
{
  // All memory is allocated in one block.
  free( (void*) pyramid_array );
}
