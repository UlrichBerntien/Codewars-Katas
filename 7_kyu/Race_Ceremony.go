package kata

func RacePodium(blocks int) [3]int {
	if blocks < 6 {
		panic("argument out of range")
	}
	base := blocks/3 - 1
	top := base + 2
	second := base + 1
	third := base
	switch blocks % 3 {
	case 1:
		top++
		if base > 1 {
			second++
			third--
		}
	case 2:
		top++
		second++
	case 0:
	}
	return [3]int{second, top, third}
}
