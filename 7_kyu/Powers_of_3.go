package kata

func LargestPower(n uint64) int {
    k := -1
    for ref := uint64(1); ref < n; k++ { ref *= 3 }
    return k
}