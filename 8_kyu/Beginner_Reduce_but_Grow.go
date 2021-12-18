package kata

func Grow(arr []int) int {
    factor := 1
    for _, value := range arr { factor *= value }
    return factor
}