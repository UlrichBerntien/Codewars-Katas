package kata

import "strconv"

func StringToNumber(str string) int {
	value, error := strconv.Atoi(str)
	if error != nil {
		// Error case not specified. Simply return 0.
		value = 0
	}
	return value
}
