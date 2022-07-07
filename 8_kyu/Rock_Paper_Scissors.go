package kata

// Translate answer string to index number.
func index(answer string) int {
	switch answer {
	case "scissors":
		return 0
	case "paper":
		return 1
	case "rock":
		return 2
	default:
		panic("invalid player answer")
	}
}

// Rock Paper Scissors
// Parameters: Answers of player 1 and player 2.
// Return the result of the game.
func Rps(p1, p2 string) string {
	delta := index(p2) - index(p1)
	switch delta {
	case 0:
		return "Draw!"
	case 1, -2:
		return "Player 1 won!"
	default:
		return "Player 2 won!"
	}
}
