fun Array<CharArray>.contains(x: Char): Boolean = this.any {it.contains(x)}

fun Array<CharArray>.count(predicate: (Char) -> Boolean): Int = this.sumBy {it.count(predicate)}

fun crap(x: Array<CharArray>, bags: Int, cap: Int): String {
    if( x.contains('D') ) {
        return "Dog!!"
    } else {
        val craps = x.count {it == '@'}
        return if( craps <= bags*cap ) "Clean" else "Cr@p"
    }
}