package kata

func Tickets(peopleInLine []int) string {
	// number of bills in the wallett
	wallet100 := 0
	wallet50 := 0
	wallet25 := 0
	for _, bill := range peopleInLine {
		switch {
		// First: ignore the limited number of 25 dollar bills
		case bill == 100 && wallet50 > 0:
			wallet100++
			wallet50--
			wallet25--
		case bill == 100 && wallet50 == 0:
			wallet100++
			wallet25 -= 3
		case bill == 50:
			wallet50++
			wallet25--
		case bill == 25:
			wallet25++
		}
		// Second: check if the change was possible
		if wallet25 < 0 {
			return "NO"
		}
	}
	// ok, the queue was processed without an error
	return "YES"
}
