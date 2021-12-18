package kata
import "sort"

func Comp(array1 []int, array2 []int) bool {
    if array1 == nil || array2 == nil { return false }
    if len(array1) != len(array2) { return false }
    for i,v := range array1 {
        if v < 0 { array1[i] = -v }
    }
    sort.Ints(array1)
    sort.Ints(array2)
    for i,v := range array1 {
        if v*v != array2[i] { return false }
    }
    return true
}