fun rowSumOddNumbers(n: Int): Int {
    // gauss sum formula: sum of 1..N-1
    fun gauss(N:Int): Int = N*(N-1)/2
    return 2*(gauss(gauss(n+1))-gauss(gauss(n)))+n
}