package kata

import "strconv"

// Check if a is bigger than b
func bigger(a, b []rune) bool {
	n := len(a)
	if len(b) != n {
		panic("array len differnt")
	}
	i := 0
	for i < n && a[i] == b[i] {
		i++
	}
	return i < n && a[i] > b[i]
}

func biggestDevision(st string, k int) string {
	runes := []rune(st)
	// use maximal length for the biggest sub number
	biggestLen := len(runes) - k
	if biggestLen < 1 {
		panic("no devisions possible")
	}
	biggest := runes[0:biggestLen]
	// last start index to check
	last := len(runes) - biggestLen
	for i := 0; i <= last; i++ {
		test := runes[i : i+biggestLen]
		if bigger(test, biggest) {
			biggest = test
		}
	}
	return string(biggest)
}

func Solve(st string, k int) int {
	result, err := strconv.Atoi(biggestDevision(st, k))
	if err != nil {
		panic(err)
	}
	return result
}
