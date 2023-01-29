package kata

func BreakChocolate(n, m int) int {
    switch {
    case n < 1 || m < 1:
        return 0
    case m == 1:
        return n-1
    case n == 1:
        return m-1
    case m > n:
        mhalf := m/2
        return 1 + BreakChocolate(n,mhalf) + BreakChocolate(n,m-mhalf)
    default:
        nhalf := n/2
        return 1 + BreakChocolate(nhalf,m) + BreakChocolate(n-nhalf,m)
    }
}    