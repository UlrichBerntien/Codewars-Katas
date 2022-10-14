package kata

import "math"

// Returns minimum of a and b.
func min64(a, b int64) int64 {
	if a < b {
		return a
	}
	return b
}

// Reverse the items in the array.
// Reverses inplace.
func reverse64(a []int64) {
	for i, j := 0, len(a)-1; i < j; i, j = i+1, j-1 {
		a[i], a[j] = a[j], a[i]
	}
}

// Integer root.
// Returns largest integer i with i² = x
func root64(x int64) int64 {
	i := int64(math.Sqrt(float64(x)))
	// Test round up to fix floating point rounding errors
	for {
		t := i + 1
		if t*t > x {
			break
		}
		i = t
	}
	return i
}

// Decompose nn and append the roots to the list.
// Returns the decomposition list decreasing.
// Returns false if decomposition is possible.
func decompose_step(nn int64, list []int64) ([]int64, bool) {
	// decompose of negative values are not possible
	if nn < 0 {
		panic("argument error: nn < 0")
	}
	// decompose of 0: nothing to do
	if nn == 0 {
		return list, true
	}
	length := len(list)
	last := int64(math.MaxInt64)
	if length > 0 {
		last = list[length-1]
	}
	// append a item to hold the next step in the solution
	list = append(list, 0)
	// the root is the maximal possible value for the decomposition
	start := root64(nn)
	if start*start == nn {
		// If the rest is a square of an integer
		// -> Take the root only if it is not the single element in the result list.
		if length > 0 && start < last {
			list[length] = start
			return list, true
		}
		// else: do not create a single element list, start search below the root
		start--
	}
	for s := min64(start, last-1); s > 0; s-- {
		list[length] = s
		if list, ok := decompose_step(nn-s*s, list); ok {
			return list, true
		}
	}
	// no decomposition found
	return list[:length], false
}

// Decomposes n² into a strictly (!) increasing sequence of numbers so
// that the sum of all items squared is n²: sum(i²) = n².
// Does a decompose into at least two numbers.
// Returns an empty list if decomposition is not possible.
func Decompose(n int64) []int64 {
	list, _ := decompose_step(n*n, make([]int64, 0))
	reverse64(list)
	return list
}
