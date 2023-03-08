/**
 * Calculates the percentage of infection.
 *
 * @param s World: X = continent separation, 1 = infected, 0 = not infected at begin
 * @return Percentage of infections if one infection can infect all on a continent.
 */
fun infected(s: String): Double {
    // values summed over all continents
    var infected = 0.0
    var total = 0.0
    // values of current continent
    var count = 0
    var virus = false
    // update values over all continents by values of current continent
    fun nextContinent() {
        if (virus) infected += count
        total += count
        count = 0
        virus = false
    }
    // process the world
    s.onEach {
        when (it) {
            '0' -> count++
            '1' -> {
                count++
                virus = true
            }
            'X' -> nextContinent()
            else -> {}
        }
    }
    nextContinent()
    return if (total > 0) 100 * infected / total else 0.0
}
