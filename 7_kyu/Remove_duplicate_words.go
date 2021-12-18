package kata

import "strings"

func RemoveDuplicateWords(str string) string {
	input := strings.Fields(str)
	seen := make(map[string]bool, len(input))
	output := make([]string, 0, len(input))
	for _, s := range input {
		if !seen[s] {
			output = append(output, s)
			seen[s] = true
		}
	}
	return strings.Join(output, " ")
}
