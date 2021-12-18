package kata

func monkeyCount(n int) []int {
    arr := make([]int, n)
    for index := 0; index < n; index++ { arr[index] = index+1 }
    return arr
}