fun findShort(s: String): Int =
    s.splitToSequence(" ").map { it.length }.min() ?: 0