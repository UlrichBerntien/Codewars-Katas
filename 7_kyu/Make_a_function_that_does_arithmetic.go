package kata

func Arithmetic(a int, b int, operator string) int {
	var r int
	switch operator {
	case "add":
		r = a + b
	case "subtract":
		r = a - b
	case "multiply":
		r = a * b
	case "divide":
		r = a / b
	default:
		panic("invalid operator")
	}
	return r
}
