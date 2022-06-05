package kata
import "math"

func Solve(m float64) float64 {
    // The infinite sum is U = x/(1-x)² for |x| < 1
    // With g = 1/2U + 1 the inverse is
    // x = g +/- sqrt(g² - 1)
    g := 1 + 1/(2*m)
    return g - math.Sqrt(g*g - 1)
}