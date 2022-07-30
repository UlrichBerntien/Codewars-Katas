package kata

// Creates empty n x n square.
// Return: Integer field filled with 0s.
func makeSquare(n int) [][]int {
	square := make([][]int, n)
	for i := 0; i < n; i++ {
		square[i] = make([]int, n)
	}
	return square
}

// Generates Magic Square with Siamese method.
// https://en.wikipedia.org/wiki/Siamese_method
// n : width/height of the square.
//     Only odd lengths are possible.
// Return: the magic square.
func MagicSquare(n int) [][]int {
	if n < 0 || n&1 == 0 {
		panic("invald size")
	}
	last := n * n
	square := makeSquare(n)
	// current indices in the square
	current_x := n / 2
	current_y := 0
	// fill the square
	for i := 1; i <= last; i++ {
		square[current_y][current_x] = i
		// try diagonal up step
		next_x := (current_x + 1) % n
		next_y := (current_y - 1 + n) % n
		if square[next_y][next_x] > 0 {
			// if field is in use, step down
			current_y = (current_y + 1) % n
		} else {
			// do the diagonal up step.
			current_x = next_x
			current_y = next_y
		}
	}
	return square
}
