package kata

func CreateIterator(fn func(int) int, n int) func(int) int {
	return func(x int) int {
		for i := 0; i < n; i++ {
			x = fn(x)
		}
		return x
	}
}
