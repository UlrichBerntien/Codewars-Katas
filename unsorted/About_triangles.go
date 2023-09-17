package kata

func bool2byte(b bool) byte {
	if b {
		return 1
	} else {
		return 0
	}
}

func TriangleType(a, b, c int) string {
	switch bool2byte(a == b) + bool2byte(b == c) + bool2byte(c == a) {
	case 3:
		return "equi"
	case 1:
		return "iso"
	default:
		return "sca"
	}
}
