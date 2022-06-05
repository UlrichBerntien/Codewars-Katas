package kata

func AddLetters(letters []rune) rune {
	const aOffset rune = 'a' - 1
	const zValue rune = 'z' - aOffset
	var sum rune = zValue
	for _, r := range letters {
		sum += r - aOffset
		if sum > zValue {
			sum -= zValue
		}
	}
	return sum + aOffset
}
