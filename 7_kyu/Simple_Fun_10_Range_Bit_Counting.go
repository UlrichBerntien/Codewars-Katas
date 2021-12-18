package kata

import "math/bits"

func RangeBitCount(a,b int) int {
    var sum int = 0
    if a >= 0 && b >= a {
        ub := uint(b)
        for it := uint(a); it <= ub; it++ {
            sum += bits.OnesCount(it)
        }
    }
    return sum
}