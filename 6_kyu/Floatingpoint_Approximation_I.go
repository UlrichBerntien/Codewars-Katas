package kata

import "math"

func F(x float64) float64 {
	if math.Abs(x) < 1e-3 {
		// Taylor series of sqrt(1+x)-1:
		// https://www.wolframalpha.com/input/?i=series+sqrt%28x%2B1%29-1+at+x%3D0
		// x/2 - x^2/8 + x^3/16 - (5 x^4)/128 + (7 x^5)/256 - (21 x^6)/1024 + O(x^7)
		// Fast calculation of the polynom with Horner's method.
		return (((((-21./1024*x+7./256)*x-5./128)*x+1./16)*x-1./8)*x+.5)*x
	} else {
		return math.Sqrt(1+x) - 1
	}
}
