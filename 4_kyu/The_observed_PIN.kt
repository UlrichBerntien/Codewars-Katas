/**
 * Generates all possible PINs based on the observed PIN. The true PIN is around the observed PIN.
 * Each key could be also the key around the observed key.
 *
 * @param The observed PIN.
 * @return All possible PINs.
 */
fun getPINs(observed: String): List<String> =
    when (observed.length) {
        0 -> emptyList()
        1 -> keyNeighbours[observed[0]]!!.map { it.toString() }
        else -> {
            var accu = emptyList<String>()
            val lhs = keyNeighbours[observed[0]]!!
            getPINs(observed.substring(1)).forEach { rhs -> lhs.forEach { it -> accu += it + rhs } }
            accu
        }
    }

/**
 * Map from observed key to all possible input kyes. Maps to an empty array if the key is not on the
 * keypad.
 */
private val keyNeighbours: Map<Char, CharArray> = generateKeyNeighbours("123,456,789, 0 ")

/**
 * Generates the map from observed key to possible keys.
 *
 * @param layout The layout of the keypad. Rows of the key pad are separated by comma.
 * @return Map observerd key -> possible keys.
 */
private fun generateKeyNeighbours(layout: String): Map<Char, CharArray> {
    var accu = HashMap<Char, CharArray>().withDefault { CharArray(0) }
    val keys: Array<String> = layout.split(',').toTypedArray()
    fun getKey(x: Int, y: Int): Char? =
        if (y in keys.indices && x in keys[y].indices && keys[y][x] != ' ') keys[y][x] else null
    for (row in keys.indices) for (col in keys[row].indices) getKey(col, row)?.let { k ->
        var options = emptyList<Char>()
        listOf(Pair(0, +1), Pair(0, -1), Pair(+1, 0), Pair(-1, 0), Pair(0, 0)).forEach { (x, y) ->
            getKey(col + x, row + y)?.let { options += it }
        }
        accu[k] = options.toCharArray()
    }
    return accu
}
