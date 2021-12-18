package kata

func Past(h, m, s int) int {
    return 1000*(60*(60*h+m)+s)
}