package kata

func LongestRepetition(text string) Result {
	longest := Result{}
	current := Result{}
	for _, c := range text {
		if c == current.C {
			current.L += 1
		} else {
			if longest.L < current.L {
				longest = current
			}
			current.C = c
			current.L = 1
		}
	}
	if longest.L < current.L {
		longest = current
	}
	return longest
}
