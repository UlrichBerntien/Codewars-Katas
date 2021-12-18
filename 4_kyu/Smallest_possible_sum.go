package kata

func Solution(ar []int) int {
	lenAr := len(ar)
	if lenAr == 0 {
		return 0
	}
	work := make([]int, lenAr)
	copy(work, ar)
	min := work[0]
	countIsMin := 1
	for countIsMin < lenAr {
		countIsMin = 0
		for i, v := range work {
			switch {
			case v == min:
				countIsMin++
			case v < min && v > 0:
				min = v
				countIsMin = 1
			case v > min:
				work[i] = v % min
				if work[i] == 0 {
					work[i] = min
					countIsMin++
				} else {
					min = work[i]
					countIsMin = 1
				}
			}
		}
	}
	return countIsMin * min
}
