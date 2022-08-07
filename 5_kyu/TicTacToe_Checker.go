package kata

// Coordinates of a 3 field run on the field.
type run struct {
	x, y   int8 // index start position
	dx, dy int8 // index delta
}

// All possible runs on the field to win
var runOptions = [...]run{
	{0, 0, 1, 0},
	{0, 0, 0, 1},
	{0, 0, 1, 1},
	{1, 0, 0, 1},
	{2, 0, 0, 1},
	{0, 1, 1, 0},
	{0, 2, 1, 0},
	{0, 2, 1, -1},
}

// Check Status of Tic-Tac-Toe board.
// Return Player 1 won : 1
//        Player 2 won : 2
//        No won and empty spot exists : -1
//        No won and board full : 0
func IsSolved(board [3][3]int) int {
	// Search a winner
	for _, it := range runOptions {
		x, y := it.x, it.y
		player := board[y][x]
		if player == 0 {
			continue
		}
		x += it.dx
		y += it.dy
		if player != board[y][x] {
			continue
		}
		x += it.dx
		y += it.dy
		if player == board[y][x] {
			return player
		}
	}
	// Search empty spot
	for y := 0; y < 3; y++ {
		row := board[y]
		for x := 0; x < 3; x++ {
			if row[x] == 0 {
				return -1
			}
		}
	}
	// Game is draw and no empty spot
	return 0
}
