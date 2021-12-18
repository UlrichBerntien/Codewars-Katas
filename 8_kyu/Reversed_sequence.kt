fun reverseSeq(n: Int): List<Int> =
    generateSequence(n) {it-1}
    .take(n)
    .toList()