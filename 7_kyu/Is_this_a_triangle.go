package kata

func IsTriangle(a, b, c int) bool {
    sum := a + b + c
    return 2*a < sum && 2*b < sum && 2*c < sum
}