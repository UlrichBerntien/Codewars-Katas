package kata

// The used board
type boardType [][]int

// Position on the board
type position struct {
	x, y int
}

// directions
type direction int

const (
	directionRight = 0
	directionDown  = 1
	directionLeft  = 2
	directionUp    = 3
)

// Creates a new empty board.
// Empty == all cells have value 0.
func newBoard(size int) boardType {
	result := make(boardType, size)
	for i := range result {
		result[i] = make([]int, size)
	}
	return result
}

// Marks position as part of the spiral.
func set(board boardType, pos position) {
	board[pos.y][pos.x] = 1
}

// Checks if position is free.
// Returns true if and only if the cell is empty.
func free(board boardType, pos position) bool {
	return board[pos.y][pos.x] == 0
}

// Checks if position is outside the board.
// Returns true if and only if the position is outside the board.
func outside(board boardType, pos position) bool {
	return pos.x < 0 ||
		pos.y < 0 ||
		pos.x >= len(board) ||
		pos.y >= len(board)
}

// Steps to next position in the given direction.
func step(pos position, dir direction) position {
	switch dir {
	case directionRight:
		return position{pos.x + 1, pos.y}
	case directionDown:
		return position{pos.x, pos.y + 1}
	case directionLeft:
		return position{pos.x - 1, pos.y}
	case directionUp:
		return position{pos.x, pos.y - 1}
	default:
		return pos
	}
}

// Returns next direction to go on the spiral path.
func nextDirection(dir direction) direction {
	if dir < directionUp {
		return dir + 1
	} else {
		return directionRight
	}
}

// Checks if step into the direction is possible on the board.
// Return: True if and only if the step is possible.
func canStep(board boardType, pos position, dir direction) bool {
	pos1 := step(pos, dir)
	if outside(board, pos1) || !free(board, pos1) {
		return false
	}
	pos2 := step(pos1, dir)
	if outside(board, pos2) {
		return true
	}
	return free(board, pos2)
}

// Returns a board with a spiral drown on it.
// The board is a square size x size.
// Value 0 == free, value 1 == spiral element.
func Spiralize(size int) [][]int {
	board := newBoard(size)
	var pos position
	var dir direction
	var segmentLength int
	for {
		set(board, pos)
		segmentLength++
		if !canStep(board, pos, dir) {
			// change direction
			dir = nextDirection(dir)
			if segmentLength < 2 || !canStep(board, pos, dir) {
				// End position reached
				return board
			}
			segmentLength = 0
		}
		pos = step(pos, dir)
	}
}
