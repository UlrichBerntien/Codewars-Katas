package kata

func PositiveSum(numbers []int) (accu int) {
    for _,v := range numbers {
        if v > 0 { accu += v }
    }
    return
}
