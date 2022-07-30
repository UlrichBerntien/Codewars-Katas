package kata

// Sorts 2 integers.
func sort(x, y int) (min, max int) {
	if x < y {
		min, max = x, y
	} else {
		min, max = y, x
	}
	return
}

// Returns list of maximal sized square in the rectangle.
// Arguments: length and width of the rectangle.
// Return: List of squares (edge length) which fills the rectangle.
func SquaresInRect(lng int, wdth int) []int {
	if lng == wdth {
		// Special case: input is a square
		// Return nil
		return nil
	}
	accu := make([]int, 0)
	a, A := sort(lng, wdth)
	for a > 0 {
		accu = append(accu, a)
		a, A = sort(a, A-a)
	}
	return accu
}
