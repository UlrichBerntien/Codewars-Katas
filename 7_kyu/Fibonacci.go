package kata

// Cache known Fibonacci numbers.
// A number is cached if value is >= 0.
var fib = []int{0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, -1}

func Fib(n int) int {
	for len(fib) <= n {
		// expand cache
		fib = append(fib, -1)
	}
	switch {
	case n <= 0:
		return 0
	case fib[n] > 0:
		// number is alread known
		return fib[n]
	default:
		// simple recursive calculation
		f := Fib(n-1) + Fib(n-2)
		fib[n] = f
		return f
	}
}
