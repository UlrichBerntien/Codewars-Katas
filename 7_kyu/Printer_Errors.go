package kata

import "strconv"

func PrinterError(s string) string {
	var badCount int
	for _, r := range s {
		if r < 'a' || r > 'm' {
			badCount++
		}
	}
	return strconv.Itoa(badCount) + "/" + strconv.Itoa(len(s))
}
