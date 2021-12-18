package kata

import "bytes"

func Interpreter(code string) string {
	var accu bytes.Buffer
	memory := byte(0)
	for _, r := range code {
		switch r {
		case '+':
			memory++
		case '.':
			accu.WriteByte(memory)
		}
	}
	return accu.String()
}
