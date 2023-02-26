package kata

object KataSolution {
    /**
     * Searchs longest sequence of same character in the string.
     *
     * @param s Scans this string
     * @return Char and number consecutive repetitions. On string is empty returns null,0.
     */
    fun longestRepetition(s: String): Pair<Char?, Int> {
        if (s.length == 0) return Pair(null, 0)
        var current_c = s[0]
        var max_c = current_c
        var current_n = 0
        var max_n = current_n
        for (c in s.iterator())
            if (c == current_c) {
                current_n++
            } else {
                if (current_n > max_n) {
                    max_n = current_n
                    max_c = current_c
                }
                current_n = 1
                current_c = c
            }
        return if (current_n > max_n) Pair(current_c, current_n) else Pair(max_c, max_n)
    }
}
