#include <stdlib.h>

/*
 *  Returns array of size 2 filled by a and b.
 *  a,b : values to store
 *  return : new allocated array. The caller must free it.
 */
static size_t* tuple(const size_t a, const size_t b) {
  size_t *const t = calloc(2, sizeof (size_t));
  // error exit on out-of-memory
  if(!t) return NULL;
  t[0] = a;
  t[1] = b;
  return t;
}

/**
 *  Returns position of the mine.
 *  A mine is a element != 0.
 *  n : size of the 2D array.
 *  field : array of rows. A row is an array of integers.
 *  return : new allocated array, [row index, col index]. The caller must free it.
 */
size_t *mine_location(size_t n, const int field[n][n]) {
  if(n && field)
    for(size_t row = 0; row < n; ++row)
      for(size_t col = 0; col < n; ++col)
        if(field[row][col])
          return tuple(row,col);
  // no mine found
  return NULL;
}
