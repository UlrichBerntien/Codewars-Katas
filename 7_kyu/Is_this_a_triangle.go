package kata

func IsTriangle(a, b, c int) bool {
    return a < b+c && b < a+c && c < a+b
}