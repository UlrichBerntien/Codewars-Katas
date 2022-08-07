package kata

func ValidBraces(str string) bool {
	// Store the open braces on a stack.
	stack := make([]rune, 0)
	// push on stack
	push := func(r rune) {
		stack = append(stack, r)
	}
	// Close last opening brace.
	// Return false if the lat brace was not r.
	close := func(r rune) bool {
		if len(stack) > 0 && stack[len(stack)-1] == r {
			stack = stack[:len(stack)-1]
			return true
		} else {
			return false
		}
	}
	// Parse the string rune by rune
	for _, r := range str {
		switch r {
		case '(', '[', '{':
			push(r)
		case ')':
			if !close('(') {
				return false
			}
		case '}':
			if !close('{') {
				return false
			}
		case ']':
			if !close('[') {
				return false
			}
		default: // ignore all other chars
		}
	}
	// If all braces are closed, the string is correct.
	return len(stack) == 0
}
