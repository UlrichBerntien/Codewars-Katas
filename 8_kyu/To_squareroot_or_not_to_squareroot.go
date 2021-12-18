package kata
import "math"

func SquareOrSquareRoot(arr []int) []int{
    result := make([]int,len(arr))
    for i,v := range arr {
        sqrt := int( math.Sqrt( float64(v) ) )
        if sqrt*sqrt == v {
            result[i] = sqrt
        } else {
            result[i] = v*v
        }
    }
    return result
}