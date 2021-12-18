package kata

func CountPositivesSumNegatives(numbers []int) []int {
	countPlus := 0
	sumNeg := 0
	for _, x := range numbers {
		if x > 0 {
			countPlus++
		} else {
			sumNeg += x
		}
	}
	return []int{countPlus, sumNeg}
}
