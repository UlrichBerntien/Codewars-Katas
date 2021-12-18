package kata

var black = [88]bool{
	1: true, 4: true, 6: true, 9: true,
	11: true, 13: true, 16: true, 18: true,
	21: true, 23: true, 25: true, 28: true,
	30: true, 33: true, 35: true, 37: true,
	40: true, 42: true, 45: true, 47: true, 49: true,
	52: true, 54: true, 57: true, 59: true,
	61: true, 64: true, 66: true, 69: true,
	71: true, 73: true, 76: true, 78: true,
	81: true, 83: true, 85: true}

func BlackOrWhiteKey(keyPressCount int) string {
	if black[(keyPressCount-1)%88] {
		return "black"
	} else {
		return "white"
	}
}
