package kata

func Fusc(n int) int {
    for n > 0 && n & 1 == 0 { n /= 2 } // rule 3
    switch n {
    case 0:
        return 0 // rule 1
    case 1:
        return 1 // rule 2
    default:
        return Fusc(n/2) + Fusc(n/2+1) // rule 4
    }
}