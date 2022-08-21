package kata

// Splits str into strings of 2 characters.
// Adds a '_' if the number of chars in the str is odd.
func Solution(str string) []string {
	// Allow multibyte-character string: work with runes.
	r := []rune(str)
	len_r := len(r)
	// Round up the number of strings
	n := (len_r + 1) / 2
	result := make([]string, 0, n)
	for i := 0; i < len_r; i += 2 {
		result = append(result, string(r[i:i+2]))
	}
	if len_r&1 == 1 {
		// odd str length: need to fix the last string.
		result[n-1] = string([]rune{r[len_r-1], '_'})
	}
	return result
}
