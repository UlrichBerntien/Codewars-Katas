// Calculates coefficients of quadratic equation.
// (X-x1)(X-x2) == c[0] X² + c[1] X + c[2]
void quadratic(const int x1, const int x2, int coefficient[3]) {
  coefficient[0] = 1;
  coefficient[1] = - x1 - x2;
  coefficient[2] = x1 * x2;
}
