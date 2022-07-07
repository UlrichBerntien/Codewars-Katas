package kata

// Calculates the number of people in the bus.
// busStops for each stop: people get into bus (first item)
//        and number of people get off the bus (second item)
func Number(busStops [][2]int) int {
	number := 0
	for _, it := range busStops {
		number += it[0]
		number -= it[1]
	}
	return number
}
