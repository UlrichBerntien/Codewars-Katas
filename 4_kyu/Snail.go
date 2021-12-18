package kata

func Snail(snaipMap [][]int) []int {
	y_size := len(snaipMap)
	if y_size < 1 {
		// empty map
		return []int{}
	}
	x_size := len(snaipMap[0])
	dest_size := x_size * y_size
	dest := make([]int, dest_size)
	dest_index := 0
	x_index, x_first, x_last := 0, 0, x_size-1
	y_index, y_first, y_last := 0, 0, y_size-1
	for dest_index < dest_size {
		// left to right
		for i := x_first; i <= x_last; i++ {
			dest[dest_index] = snaipMap[y_index][i]
			dest_index++
		}
		x_index = x_last
		y_first++
		// up to down
		for i := y_first; i <= y_last; i++ {
			dest[dest_index] = snaipMap[i][x_index]
			dest_index++
		}
		y_index = y_last
		x_last--
		// right to left
		for i := x_last; i >= x_first; i-- {
			dest[dest_index] = snaipMap[y_index][i]
			dest_index++
		}
		x_index = x_first
		y_last--
		// down to up
		for i := y_last; i >= y_first; i-- {
			dest[dest_index] = snaipMap[i][x_index]
			dest_index++
		}
		y_index = y_first
		x_first++
	}
	return dest
}
