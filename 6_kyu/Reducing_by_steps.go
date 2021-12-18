package kata

func Gcdi(x, y int) int {
	if x < 0 {
		x = -x
	}
	if y < 0 {
		y = -y
	}
	for y != 0 {
		x, y = y, x%y
	}
	return x
}

func Som(x, y int) int {
	return x + y
}

func Maxi(x, y int) int {
	if x > y {
		return x
	} else {
		return y
	}
}

func Mini(x, y int) int {
	if x < y {
		return x
	} else {
		return y
	}
}

func Lcmu(x, y int) int {
	if x < 0 {
		x = -x
	}
	if y < 0 {
		y = -y
	}
	return x * y / Gcdi(x, y)
}

type FParam func(int, int) int

func OperArray(f FParam, arr []int, init int) []int {
	result := make([]int, len(arr))
	accu := init
	for index, value := range arr {
		accu = f(accu, value)
		result[index] = accu
	}
	return result
}
