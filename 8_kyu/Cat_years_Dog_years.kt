package solution

fun calculateYears(years: Int): Array<Int> = when(years) {
    0 -> arrayOf(0, 0, 0)
    1 -> arrayOf(1, 15, 15)
    else -> arrayOf(years, 15+9+4*(years-2), 15+9+5*(years-2))
    }