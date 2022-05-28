package kata

func Incrementer(n []int) []int {
    result := make([]int,len(n))
    for i,v := range n {
        result[i] = (v + i + 1) % 10;
    }
    return result
}
