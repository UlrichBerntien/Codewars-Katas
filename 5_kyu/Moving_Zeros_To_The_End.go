package kata

// MovesZeros works in place, changes the argument array.
func MoveZeros(arr []int) []int {
	// index to destination in the array
	dst := 0
	// moves all non zero
	for _, v := range arr {
		if v != 0 {
			arr[dst] = v
			dst++
		}
	}
	// fills with zero/moves zeros to end
	n := len(arr)
	for dst < n {
		arr[dst] = 0
		dst++
	}
	return arr
}
