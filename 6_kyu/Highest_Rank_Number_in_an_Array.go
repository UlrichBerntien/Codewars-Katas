package kata

func HighestRank(nums []int) int {
	// count the numbers
	counter := make(map[int]int)
	for _, number := range nums {
		counter[number]++
	}
	// search the highest rank
	maxCount := -1
	maxNumber := 0
	for number, count := range counter {
		if count > maxCount || (count == maxCount && number > maxNumber) {
			maxCount = count
			maxNumber = number
		}
	}
	return maxNumber
}
