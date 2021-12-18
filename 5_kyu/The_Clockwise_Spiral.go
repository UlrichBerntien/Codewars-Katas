package kata

// Makes a squqre x*x of integers filled with 0.
func makeSquare(n int) [][]int {
	field := make([][]int, n)
	for i := range field {
		field[i] = make([]int, n)
	}
	return field
}

func CreateSpiral(n int) [][]int {
	if n <= 0 {
		return [][]int{}
	}
	field := makeSquare(n)
	// start point
	x, y := 0, 0
	// start direction: left
	stepX, stepY := 1, 0
	// number of last field
	lastNr := n * n
	for nr := 1; nr <= lastNr; nr++ {
		field[y][x] = nr
		// next field in the current direction
		nextX, nextY := x+stepX, y+stepY
		if nextX < 0 || nextX >= n || nextY < 0 || nextY >= n || field[nextY][nextX] > 0 {
			// turn right
			stepX, stepY = -stepY, stepX
			x, y = x+stepX, y+stepY
		} else {
			x, y = nextX, nextY
		}
	}
	return field
}
