package solution

object PlayPass {

    fun playPass(s: String, n: Int): String {
        fun playChar(c: Char): Char = when(c) {
            in '0'..'9' -> '0' + ('9' - c)
            in 'a'..'z' -> 'a' + ((c-'a') + n) % 26
            in 'A'..'Z' -> 'A' + ((c-'A') + n) % 26
            else        -> c
        }
        return s.map(::playChar)
                .mapIndexed { idx, c -> if( idx % 2 > 0 ) c.toLowerCase() else c.toUpperCase() }
                .reversed()
                .joinToString("")
    }
}