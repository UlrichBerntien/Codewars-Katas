package kata

import "strconv"

// Interprets all items in the array as integers and sums the values.
// Ignores non-integer like items.
func SumMix(arr []any) int {
	var accu int
	for _, it := range arr {
		switch it.(type) {
		case int:
			accu += it.(int)
		case uint:
			accu += int(it.(uint))
		case int8:
			accu += int(it.(int8))
		case uint8:
			accu += int(it.(uint8))
		case string:
			value, err := strconv.Atoi(it.(string))
			if err == nil {
				accu += value
			} // else: ignore string without integer number
		default:
			// ignore this array item
		}
	}
	return accu
}
