package kata

func ReverseSeq(n int) []int {
	seq := make([]int, n)
	for i := range seq {
		seq[i] = n - i
	}
	return seq
}
