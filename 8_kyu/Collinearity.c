#include <stdbool.h>

/*
 *  Tests of collinearity of 2D integer vectors.
 *  Arguments:
 *    (x1,y1) = coordinates vector 1.
 *    (x2,y2) = coordinates vector 2.
 *  Return:
 *    true if vectors are collinear.
 *    false else.
 */
bool collinearity(int x1, int y1, int x2, int y2) {
  return x2 * y1 == y2 * x1;
}