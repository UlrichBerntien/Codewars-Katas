fun duplicateCount(text: String): Int {
    val counter = HashMap<Char, Int>(36)
    for (c in text) {
        val C = c.toUpperCase()
        counter[C] = counter.getOrDefault(C, 0) + 1
    }
    return counter.count { it.value > 1 }
}