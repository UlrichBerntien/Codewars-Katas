package kata

func SquareSum(numbers []int) (sum int) {
    for _,v := range numbers {
        sum += v*v
    }
    return
}