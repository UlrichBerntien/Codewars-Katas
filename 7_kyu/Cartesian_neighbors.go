package kata

func CartesianNeighbor(x,y int) [][]int{
    result := make([][]int,8)
    i := 0
    for dx := -1; dx < 2; dx++ {
        for dy := -1; dy < 2; dy++ {
            if dx != 0 || dy != 0 {
                result[i] = []int{ x+dx, y+dy }
                i++
            }
        }
    }
    return result
}