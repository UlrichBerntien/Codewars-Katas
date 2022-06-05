package kata

func FindOutlier(integers []int) int {
	if len(integers) < 3 {
		panic("integers too short")
	}
	majority := (integers[0]&1 + integers[1]&1 + integers[2]&1) / 2
	for _, v := range integers {
		if v&1 != majority {
			return v
		}
	}
	panic("no outlier")
}
