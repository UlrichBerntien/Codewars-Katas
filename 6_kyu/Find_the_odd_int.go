package kata

func FindOdd(seq []int) int {
	mp := make(map[int]bool)
	for _, it := range seq {
		current, _ := mp[it]
		mp[it] = !current
	}
	for idx, it := range mp {
		if it {
			return idx
		}
	}
	panic("no odd int")
}
