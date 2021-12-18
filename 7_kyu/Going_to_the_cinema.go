package kata

import "math"

func Movie(card, ticket int, perc float64) int {
	// normal ticket
	ticketF := float64(ticket)
	// reduced ticket, reduced by perc at every visit
	ticketR := ticketF
	// no card in system A
	systemA := float64(0)
	// card before the first visit
	systemB := float64(card)
	n := 0
	for systemA <= math.Ceil(systemB) {
		ticketR *= perc
		// add coast for a visit
		systemA += ticketF
		systemB += ticketR
		n++
	}
	return n
}
