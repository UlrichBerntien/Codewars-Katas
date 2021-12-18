package kata

import "sort"

func abs(x int) int {
	if x < 0 {
		return -x
	}
	return x
}

func Prod2Sum(a, b, c, d int) [][]int {
	firstPair := []int{abs(a*c + b*d), abs(b*c - a*d)}
	sort.Ints(firstPair)
	secondPair := []int{abs(a*c - b*d), abs(b*c + a*d)}
	sort.Ints(secondPair)
	delta := firstPair[0] - secondPair[0]
	switch {
	case delta < 0:
		return [][]int{firstPair, secondPair}
	case delta > 0:
		return [][]int{secondPair, firstPair}
	default: // delta == 0
		return [][]int{firstPair}
	}
}
