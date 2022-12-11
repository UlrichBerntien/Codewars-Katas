#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>

// Possible rotations of a matrix.
// All rotated matrices are equivalent in this kata.
// First index: selected rotation.
// Second index: index to get each item in the matrix.
static const unsigned ROTATIONS [4][4] = {
  {0, 1, 2, 3},
  {2, 0, 3, 1},
  {3, 2, 1, 0},
  {1, 3, 0, 2}
};

// Converts a matrix into a single integer.
// Limitations: Values 0 .. 0xff of the matrix elements.
static uint32_t matrix_to_uint (const short mat[4], const short rotation) {
  uint32_t accu = 0;
  assert( 0 <= rotation && rotation <= 3 );
  const unsigned *const indices = ROTATIONS[rotation];
  for( short i = 0; i < 4; ++i ) {
    assert( mat[indices[i]] >= 0 );
    assert( mat[indices[i]] < 0x100 );
    accu = (accu << 8) + mat[indices[i]];
  }
  return accu;
}


// Converts rotatable matrix into a single integer.
// All rotations of a matrix have the same integer value.
static uint32_t rotatable_matrix_to_uint (const short mat[4]) {
  uint32_t max = 0;
  for( short rot = 0; rot < 4; ++rot ) {
    const uint32_t t = matrix_to_uint(mat, rot);
    if( t > max )
      max = t;
  }
  return max;
}


// Counts number of unique matrices.
// Matrices which are rotated count as one matrix.
// Arguments:
//      n - Number of metrices = Number of items in the array matrices.
//      matrices - Array of matrices.
unsigned count_unique_matrices (const size_t n, const short matrices[n][4])
{
  if( n == 0 || matrices == NULL )
    return 0;
  size_t count = 0;
  uint32_t *const list = calloc( n, sizeof (uint32_t) );
  for( size_t src = 0; src < n; ++src ) {
    const uint32_t t = rotatable_matrix_to_uint(matrices[src]);
    size_t dst = 0;
    while( dst < count && list[dst] != t ) ++dst;
    if( dst == count )
      list[count++] = t;
  }
  free(list);
	return (unsigned) count;
}
