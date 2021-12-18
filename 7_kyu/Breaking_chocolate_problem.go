package kata

func BreakChocolate(n, m int) int {
    if n < 1 || m < 1 {
        return 0
    }        
    if m == 1 {
        return n-1
    }
    if n == 1 {
        return m-1
    }
    if m > n {
        mhalf := m/2
        return 1 + BreakChocolate(n,mhalf) + BreakChocolate(n,m-mhalf)
    } else {
        nhalf := n/2
        return 1 + BreakChocolate(nhalf,m) + BreakChocolate(n-nhalf,m)
    }
}    