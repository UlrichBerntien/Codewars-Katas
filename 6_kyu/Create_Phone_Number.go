package kata

import "strings"

func writeDigits(dst *strings.Builder, digits []uint) {
	for _, value := range digits {
		if value < 10 {
			dst.WriteRune(rune('0' + value))
		}
	}
}

func CreatePhoneNumber(numbers [10]uint) string {
	var dst strings.Builder
	dst.WriteRune('(')
	writeDigits(&dst, numbers[0:3])
	dst.WriteString(") ")
	writeDigits(&dst, numbers[3:6])
	dst.WriteRune('-')
	writeDigits(&dst, numbers[6:10])
	return dst.String()
}
