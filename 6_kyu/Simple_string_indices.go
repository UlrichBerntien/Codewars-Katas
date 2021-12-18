package kata

import "errors"

func Solution(str string, idx uint) (uint, error) {
	runes := []rune(str)
	n := uint(len(runes))
	if idx >= uint(n) || runes[idx] != '(' {
		return 0, errors.New("Not an opening bracket")
	}
	brackets := uint(0)
	for i := idx; i <= n; i++ {
		switch runes[i] {
		case '(':
			brackets++
		case ')':
			brackets--
			if brackets == 0 {
				return i, nil
			}
		}
	}
	return 0, errors.New("No closing bracket")
}
