package kata

import "strings"

func TwoSort(arr []string) string {
	if arr == nil || len(arr) == 0 {
		return ""
	}
	first := arr[0]
	for _, s := range arr[1:] {
		if s < first {
			first = s
		}
	}
	charstrings := make([]string, len(first))
	for i, c := range first {
		charstrings[i] = string(c)
	}
	return strings.Join(charstrings, "***")
}
