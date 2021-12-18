package kata

func SmallestIntegerFinder(numbers []int) int {
	if numbers == nil || len(numbers) < 1 {
		return 0
	}
	smallest := numbers[0]
	for _, v := range numbers {
		if v < smallest {
			smallest = v
		}
	}
	return smallest
}
