package kata

import "unicode"

func Solve(s string) []int {
	cnt_upper := 0
	cnt_lower := 0
	cnt_digit := 0
	cnt_other := 0
	for _, c := range s {
		switch {
		case unicode.IsUpper(c):
			cnt_upper++
		case unicode.IsLower(c):
			cnt_lower++
		case unicode.IsDigit(c):
			cnt_digit++
		default:
			cnt_other++
		}
	}
	return []int{cnt_upper, cnt_lower, cnt_digit, cnt_other}
}
