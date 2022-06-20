package kata

// Calculate the accumulated sums.
// Return an array with
// result[i] = sum(ls[i],ls[i+1],...,ls[last])
func PartsSums(ls []uint64) []uint64 {
	var sums []uint64 = make([]uint64, len(ls)+1)
	var accu uint64 = 0
	sums[len(ls)] = 0
	for i := len(ls) - 1; i >= 0; i-- {
		accu += ls[i]
		sums[i] = accu
	}
	return sums
}
