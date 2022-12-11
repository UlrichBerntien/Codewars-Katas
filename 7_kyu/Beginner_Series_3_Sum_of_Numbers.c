#include <assert.h>

// Returns minmum of the integers a and b.
static inline int min(const int a , const int b) {
  return a < b ? a : b;
}

// Returns maximum of the integers a and b.
static inline int max(const int a , const int b) {
  return a > b ? a : b;
}

// Returns sum of the intergers a, a+1, ..., b.
// Limitation: 0 <= a <= b.
static inline int gauss(const int a, const int b) {
  assert( a <= b );
  return ( (a+b)*(b-a+1) )/2;
}

// Returns sum of the intergers min(a,b) ... max(a,b).
int get_sum(const int a, const int b) {
  const int start = min(a,b);
  const int stop = max(a,b);
  return gauss(start,stop);
}
