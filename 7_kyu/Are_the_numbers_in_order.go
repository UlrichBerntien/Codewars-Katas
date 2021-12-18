package kata

func InAscOrder(numbers []int) bool {
    for i:=1; i < len(numbers); i++ {
        if numbers[i-1] >= numbers[i] { return false }
    }
    return true
}