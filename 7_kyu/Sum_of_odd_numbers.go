package kata

func RowSumOddNumbers(n int) int {
	// Count of numbers in the n-th row
	count := n
	// Number of numbers before the n-th row
	countBefore := (n * (n - 1)) / 2
	// First number in the n-th row
	firstValue := countBefore*2 + 1
	// Sum of the numbers in the n-th row
	return (firstValue + count - 1) * count
}
