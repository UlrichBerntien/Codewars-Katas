// Returns the total points of all games.
fun points(games: List<String>) = games.sumOf { points(parseGame(it)) }

// Pair of the two scores in a game result.
private typealias gameResult = Pair<Int, Int>

// Parses game result from string "score:score" into gameResult integer pair.
private fun parseGame(game: String): gameResult {
    val splits = game.split(":", limit = 3)
    if (splits.size != 2) throw IllegalArgumentException()
    return splits[0].trim().toInt() to splits[1].trim().toInt()
}

// Returns the points of the first team from a game result.
private fun points(result: gameResult): Int {
    val delta = result.first - result.second
    return when {
        delta > 0 -> 3
        delta < 0 -> 0
        else -> 1
    }
}
