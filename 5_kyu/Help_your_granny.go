package kata

import "math"

// use the empty string as special name for the home town
// and the base for all distances in the map
var baseTown = ""

// Calculate distance with formula given in instructions.
// Handles the special cases if a or b is the home town.
func distance(a, b string, distanceToBase map[string]float64) float64 {
	if a == baseTown {
		return distanceToBase[b]
	}
	if b == baseTown {
		return distanceToBase[a]
	}
	return math.Sqrt(math.Abs(math.Pow(distanceToBase[a], 2) - math.Pow(distanceToBase[b], 2)))
}

func Tour(arrFriends []string, ftwns map[string]string, h map[string]float64) int {
	sum := 0.0
	currentTown := baseTown
	for _, friend := range arrFriends {
		nextTown := ftwns[friend]
		if nextTown != currentTown {
			// only one of the distances is in the map
			sum += distance(currentTown, nextTown, h)
			currentTown = nextTown
		}
	}
	if currentTown != baseTown {
		sum += distance(currentTown, baseTown, h)
	}
	return int(sum)
}
