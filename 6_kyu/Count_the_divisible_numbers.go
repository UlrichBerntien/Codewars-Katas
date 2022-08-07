package kata

// Counts the number of k divisible numbers in range [x,y].
func DivisibleCount(x, y, k uint64) uint64 {
	if x > y {
		panic("invalid limits")
	}
	first := (x + k - 1) / k
	last := y / k
	// The numbers are [first*k, (first+1)*k, ... last*k].
	// The count of the numbers is
	return last - first + 1
}
