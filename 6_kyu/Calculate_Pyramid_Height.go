package kata

// Returns the maximum possible height of a perfectly square pyramid
// (number of complete layers) build with maximal 'n' cubes.
func PyramidHeight(n int) int {
	// current height of the pyramid
	height := 0
	// stones needed for the next layer
	stones := 1
	for n >= stones {
		// calculate the remainung stones
		n -= stones
		// update the current height
		height++
		// calculate the stones needed for next layer
		stones += 2*height + 1
	}
	return height
}
