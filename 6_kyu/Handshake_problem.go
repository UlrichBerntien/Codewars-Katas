package kata

import "math"

func GetParticipants(handshakes int) int {
	return int(math.Ceil((1 + math.Sqrt(8*float64(handshakes)+1)) / 2))
}
