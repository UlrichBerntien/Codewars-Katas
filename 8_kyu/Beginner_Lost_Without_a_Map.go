package kata

func Maps(x []int) []int {
    result := make([]int, len(x))
    for index, xValue := range x {
        result[index] = xValue * 2
    }
    return result
}