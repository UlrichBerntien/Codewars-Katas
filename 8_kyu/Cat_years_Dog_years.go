package kata

// Calculate cat years and dog years.
// Argument is human years.
// Returns array of human years, cat years, dot years.
func CalculateYears(years int) (result [3]int) {
	return [3]int{years, scale(years, 15, 9, 4), scale(years, 15, 9, 5)}
}

// Scales the value x.
// The slope of the next intervals are one, two, three.
// Returns one for 1, two or the next +1, three for each following +1.
func scale(x int, one int, two int, three int) int {
	switch {
	case x > 2:
		return one + two + three*(x-2)
	case x > 1:
		return one + two
	case x > 0:
		return one
	default:
		return 0
	}
}
