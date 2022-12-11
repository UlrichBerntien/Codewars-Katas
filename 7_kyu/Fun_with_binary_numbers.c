// Generate numbers 1 .. 2^n-1 with bit b = 1.
// Arguments:
//    n - Upper limit for the returned values is 2^n - 1.
//    b - Value with one bit b, 1,2,4,... in all returned values.
//    length - Set to number of values returned
//    values - Buffer for all values, allocated by caller.
void solution(const int n, const int b, int *const length, int values[]) {
  // Special case: null pointer arguments
  if( length == 0 || values == 0 )
    return;
  // Special case: bit positions does not yield in values 
  if( n < 1 || b < 1 ) {
    *length = 0;
    return;
  }
  const int limit = 1 << n;
  int current = b;
  int count = 0;
  while( current < limit ) {
    values[count++] = current;
    if( (++current & b) == 0 )
      current += b;
  }
  *length = count;
}
