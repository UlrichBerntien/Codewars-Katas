package kata

func SumCubes(n int) int {
    // https://en.wikipedia.org/wiki/Faulhaber%27s_formula
    un := uint64(n)
    return int(((((un+2)*un)+1)*un*un)/4)
}