package growth

/**
 * Calculates number of years until population p is reached.
 *
 * @param pp0 start population in year 0.
 * @param percent yearly grow in percentage
 * @param aug yearly absolute population change
 * @param p polulation to reach
 * @return year until population p reached.
 */
fun nbYear(pp0: Int, percent: Double, aug: Int, p: Int): Int {
    val grow = percent / 100
    var population = pp0
    var year = 0
    while (population < p) {
        population += (population * grow).toInt() + aug
        year++
    }
    return year
}
