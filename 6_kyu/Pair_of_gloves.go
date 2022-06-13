package kata

func NumberOfPairs(gloves []string) int {
	// Prepare a map "glove color" to number of gloves
	counter := make(map[string]int, len(gloves))
	// Count the number of gloves per color
	for _, c := range gloves {
		counter[c]++
	}
	// Count the number of pairs
	numberPairs := 0
	for _, count := range counter {
		numberPairs += count / 2
	}
	// Return the number of gloves with matching color
	return numberPairs
}
