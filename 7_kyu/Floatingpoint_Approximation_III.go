package kata

// Iteration limit
const limit float64 = 1e-12

func Quadratic(a float64, b float64, c float64) float64 {
	// approximation for b >> a
	x := -c / b
	var fx float64 = 1
	// Newton iteration
	for fx > limit {
		fx = c + (b+a*x)*x
		x -= fx / (2*a*x + b)
	}
	return x
}
