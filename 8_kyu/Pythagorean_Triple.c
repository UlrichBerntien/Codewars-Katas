#include <assert.h>
#include <stdbool.h>

// Checks if the three integers are a Pythagorean triple.
bool pythagorean_triple(const unsigned sides[3]) {
  // Partial sort the array into a,b,c.
  // Stores maximum in c. The other two values in a and b.
  unsigned a, b, c;
  if( sides[0] < sides[1] ) {
    a = sides[0];
    b = sides[1];
  } else {
    a = sides[1];
    b = sides[0];
  }
  if( b < sides[2] ) {
    c = sides[2];
  } else {
    c = b;
    b = sides[2];
  }
  assert( a <= c && b <= c );
  // Check the Pythagorean equatation.
  return a*a + b*b == c*c;
}
