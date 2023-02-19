package kata

object Kata {
    // Generates Grid n x n of letters.
    fun grid(n: Int): String? {
        if (n < 0) return null
        if (n < 1) return ""
        val accu = StringBuilder(n * (n * 2 + 1))
        for (line in 0..(n - 1)) {
            for (row in line..(line + n - 1))
                accu.append('a' + row % 26).append(' ')
            accu.set(accu.length - 1, '\n')
        }
        accu.deleteAt(accu.length - 1)
        return accu.toString()
    }
}
