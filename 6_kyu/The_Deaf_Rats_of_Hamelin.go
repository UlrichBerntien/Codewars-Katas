package kata

// Directions
const (
	left = iota
	right
)

// Parts of the rat
const (
	none = iota
	tail
	body
)

func CountDeafRats(town string) int {
	// Position of the pied piper relative to the current position:
	piedPiper := right
	// Last seen part of the rat in the string:
	lastSeenRatPart := none
	// Count of seen deaf rats:
	countDeafRats := 0
	for _, c := range town {
		switch c {
		case 'P':
			piedPiper = left
		case 'O':
			if lastSeenRatPart == tail {
				// a rat goes right
				if piedPiper == left {
					countDeafRats++
				}
				lastSeenRatPart = none
			} else {
				// ignore invalid rats with two bodies
				lastSeenRatPart = body
			}
		case '~':
			if lastSeenRatPart == body {
				// a rat goes left
				if piedPiper == right {
					countDeafRats++
				}
				lastSeenRatPart = none
			} else {
				// ignore invalid rats with two tails
				lastSeenRatPart = tail
			}
		default: // ignore other chars
		}
	}
	return countDeafRats
}
