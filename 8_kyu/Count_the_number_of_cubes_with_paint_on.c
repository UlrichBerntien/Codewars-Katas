// Calculates x³.
static inline int pow3(const int x) {
  return x*x*x;
}

// Calculates outer cubes of a root-cube cutted 'cuts' times.
int countSquares(const int cuts) {
  // Argument out of range.
  if( cuts < 0 )
    return 0;
  // Calculate number of all cubes and the number of inner cubes
  const int total_cubes = pow3(cuts+1);
  const int inner_cubes = cuts < 2 ? 0 : pow3(cuts-1);
  // Return the number of cubes in the shell
  return total_cubes - inner_cubes;
}
