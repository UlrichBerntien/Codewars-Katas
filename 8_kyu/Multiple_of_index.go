package kata

func multipleOfIndex (ints []int) []int {
    accu := make([]int, len(ints))
    next := 0
    for i := 1; i < len(ints); i++ {
        if ints[i] % i == 0 {
            accu[next] = ints[i]
            next++
        }
    }
    return accu[0:next]
}