package kata

import "sort"

func Solve(s string) bool {
    if len(s) < 2 {
        return true
    }
    r := []rune(s)
    sort.Slice(r, func(i,j int) bool { return r[i] < r[j] } )
    first := r[0]
    for index, char := range r {
        if char != first + rune(index) {
            return false
        }
    }
    return true
}