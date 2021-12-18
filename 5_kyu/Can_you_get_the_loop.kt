fun loopSize(n: Node): Int {
    var index = 0
    val visited = mutableMapOf(Pair(n, index))
    var next = n.next
    while (next != null && next !in visited) {
        visited += Pair(next, ++index)
        next = next.next
    }
    return 1 + index - (visited[next] ?: throw IllegalArgumentException("loop expected"))
}