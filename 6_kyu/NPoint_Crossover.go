package kata

// Converts array of numbers to set of numbers
// Uses a map to bool as set storage.
// i is in the set if result[i] == true.
func makeSet(numbers []int) map[int]bool {
	accu := make(map[int]bool)
	for _, i := range numbers {
		accu[i] = true
	}
	return accu
}

// ns : slice of indices
// xs, ys : chromosomes as slices of ints
func Crossover(ns, xs, ys []int) ([]int, []int) {
	crossing := makeSet(ns)
	n := len(xs)
	if n != len(ys) {
		panic("xs != ys len error")
	}
	resultA := make([]int, n)
	resultB := make([]int, n)
	a, b := xs, ys
	for i := 0; i < n; i++ {
		if crossing[i] {
			a, b = b, a
		}
		resultA[i] = a[i]
		resultB[i] = b[i]
	}
	return resultA, resultB
}
