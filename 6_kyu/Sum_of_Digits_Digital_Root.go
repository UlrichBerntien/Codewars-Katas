package kata

func DigitalRoot(n int) int {
    x := n
    for x > 9 {
        accu := 0
        for x > 0 {
            accu += x % 10
            x /= 10
        }
        x = accu
    }
    return x
}