package kata

// Calculates the coeffecients of a quadratic function ax²+bx+c.
// Arguments are the two roots x1 and x2 of the quadratic equation.
// Sets a = 1.
func Quadratic(x1, x2 int) [3]int {
  return [3]int{1, -x1-x2, x1*x2}
}
