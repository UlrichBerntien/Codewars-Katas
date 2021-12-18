package kata

import "math/big"

// Sum of the integers first .. last (including first and last)
func gauss(first, last int64) int64 {
	return (last*(last+1) - first*(first-1)) / 2
}

func Game(n int) []int {
	N := int64(n)
	var sum, tmp big.Rat
	sum.SetInt64(0)
	// first row
	for i := int64(1); i <= N; i++ {
		tmp.SetFrac64(gauss(1, i), i+1)
		sum.Add(&sum, &tmp)
	}
	// last column (with out the field in the first row)
	for i := N + 2; i <= 2*N; i++ {
		tmp.SetFrac64(gauss(i-N, N), i)
		sum.Add(&sum, &tmp)
	}
	result := []int{int(sum.Num().Int64()), int(sum.Denom().Int64())}
	if result[1] == 1 {
		return result[:1]
	} else {
		return result
	}
}
