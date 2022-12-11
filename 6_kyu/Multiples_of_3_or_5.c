// Sum of all integers up to limit (including limit).
// Returns 1 + 2 + 3 .. + (imit.
static int sum_all_int(const int limit) {
  if( limit <= 0 )
    return 0;
  return (int) ((long long) limit * (long long) (limit+1) )/2;
}

// Sum of all integers 3*i,5*i below limit.
int solution(const int limit) {
  const int n = limit-1;
  return 3*sum_all_int(n/3) + 5*sum_all_int(n/5) - 15*sum_all_int(n/15);
}
