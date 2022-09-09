package kata

func IsValidWalk(walk []rune) bool {
	// Quick check: 10 steps
	if len(walk) != 10 {
		return false
	}
	// Check: the work goes back to the start position
	positionNS := 0
	positionEW := 0
	for _, r := range walk {
		switch r {
		case 'n':
			positionNS += 1
		case 's':
			positionNS -= 1
		case 'e':
			positionEW += 1
		case 'w':
			positionEW -= 1
		default:
			return false // Invalid direction
		}
	}
	return positionNS == 0 && positionEW == 0
}
