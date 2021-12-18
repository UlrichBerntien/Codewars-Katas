package kata

func ExpressionMatter(a int, b int, c int) int {
    values := []int {
        a + b + c,
        a + b * c,
        (a + b) * c,
        a * b + c,
        a * (b + c),
        a * b * c }
    max := values[0]
    for _,v := range values[1:] {
        if v > max { max = v }
     }
     return max
}