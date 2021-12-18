package multiplicationtable

func makeZero2D(size int) [][]int {
	flat := make([]int, size*size)
	arr := make([][]int, size)
	a, b := 0, size
	for i := 0; i < size; i++ {
		arr[i] = flat[a:b]
		a, b = b, b+size
	}
	return arr
}

func MultiplicationTable(size int) [][]int {
	arr := makeZero2D(size)
	for a := 0; a < size; a++ {
		v := (a + 1) * (a + 1)
		for b := a; b < size; b++ {
			arr[a][b] = v
			arr[b][a] = v
			v += a + 1
		}
	}
	return arr
}