package kata

func FakeBin(x string) string {
	result := []rune(x)
	for i, r := range result {
		if r < '5' {
			result[i] = '0'
		} else {
			result[i] = '1'
		}
	}
	return string(result)
}
