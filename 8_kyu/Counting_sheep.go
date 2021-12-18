package kata

func CountSheeps(numbers []bool) int {
	sum := 0
	for _, it := range numbers {
		if it {
			sum++
		}
	}
	return sum
}
