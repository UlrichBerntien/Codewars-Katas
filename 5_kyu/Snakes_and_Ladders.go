package kata

import "strconv"

// Board index
const (
	boardOff   = 0
	boardFirst = 1
	boardLast  = 100
)

// Player identification.
// id 0 = player one, id 1 = player two
type playerID int

const (
	playerOne playerID = 0
	playerTwo playerID = 1
)

var playerName = [2]string{"Player 1", "Player 2"}

// Board shortcuts by snakes and ladders
// Index on the board is 1 .. 100. 0 is out of board but inside this array.
// Value is the snake tail or ladder top or 0.
var boardShortcut = [101]int{
	2: 38, 7: 14, 8: 31,
	15: 26, 16: 6,
	21: 42, 28: 84,
	36: 44,
	46: 25, 49: 11,
	51: 67,
	62: 19, 64: 60,
	71: 91, 74: 53, 78: 98,
	87: 94, 89: 68,
	92: 88, 95: 75, 99: 80,
}

// SnakesLadders - Stucture that game is played on
type SnakesLadders struct {
	nextPlayer     playerID // this player makes the next turn
	playerPosition [2]int   // Position of playerOne or playerTwo
	gameOver       bool     // true if game is over
}

// NewGame - Method that starts a new game for the SnakesLadders struct
func (sl *SnakesLadders) NewGame() {
	// Both start off the board (rule 1)
	sl.playerPosition[playerOne] = boardOff
	sl.playerPosition[playerTwo] = boardOff
	// Player one starts the game (rule 2)
	sl.nextPlayer = playerOne
	// Game runs
	sl.gameOver = false
}

// Play - Method that makes turn givem a doce roll from die1 and die2 for the SnakesLadders struct
// Player that dice is for should automatically be determined based on rules
func (sl *SnakesLadders) Play(die1, die2 int) (result string) {
	if die1 <= 0 || die2 <= 0 {
		return "Invalid die!"
	}
	if sl.gameOver {
		return "Game over!"
	}
	nextPosition := sl.playerPosition[sl.nextPlayer] + die1 + die2
	// bounce at end of field (rule 7)
	if nextPosition > boardLast {
		nextPosition = 2*boardLast - nextPosition
	}
	// Climb up ladder or slide down snake (rule 5 or rule 6)
	shortCutOut := boardShortcut[nextPosition]
	if shortCutOut > 0 {
		nextPosition = shortCutOut
	}
	// Judge game status
	if nextPosition == boardLast {
		result = playerName[sl.nextPlayer] + " Wins!"
		sl.gameOver = true
	} else {
		result = playerName[sl.nextPlayer] + " is on square " + strconv.Itoa(nextPosition)
	}
	// Next player
	sl.playerPosition[sl.nextPlayer] = nextPosition
	if die1 != die2 {
		// alternate player if no double (rule 4)
		sl.nextPlayer ^= 1
	}
	return
}
