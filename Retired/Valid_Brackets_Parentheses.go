package kata

// mapping closing parentheses -> opening parentheses
var opening = map[rune]rune{'}': '{', ']': '[', ')': '('}

func ValidMixedBracketsParentheses(parens string) bool {
	openParentheses := make([]rune, 0)
	for _, r := range parens {
		switch r {
		case '{', '[', '(':
			openParentheses = append(openParentheses, r)
		case '}', ']', ')':
			n := len(openParentheses) - 1
			if n < 0 || openParentheses[n] != opening[r] {
				// no opening parenthesis or
				// closing parenthesie does not match the last opening parentheses
				return false
			}
			openParentheses = openParentheses[:n]
		default:
			// not a parantheses
			return false
		}
	}
	// all parentheses must be closed
	return len(openParentheses) == 0
}
