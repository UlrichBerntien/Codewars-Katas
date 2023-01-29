package decod

fun modulaInverse(x: Int, m: Int): Int {
    // https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm
    var s = Pair(0, 1)
    var t = Pair(1, 0)
    var r = Pair(m, x)
    while( r.first != 0 ) {
        val quotient = r.second / r.first
        r = Pair(r.second - quotient * r.first, r.first)
        s = Pair(s.second - quotient * s.first, s.first)
        t = Pair(t.second - quotient * t.first, t.first)
    }
    return (s.second % m + m) % m 
}    

fun decode(r: String): String {
    val factor = r.takeWhile(Char::isDigit).toInt()
    if( factor % 2 == 0 || factor % 13 == 0 ) // only for this kata, I think "factor % 26 == 0" is the correct condition
        return "Impossible to decode"
    else {
        val invers = modulaInverse(factor,26)
        fun transform(c: Char): Char = ('a' + ((c.toInt()-'a'.toInt())*invers) % 26).toChar()
        return r.dropWhile(Char::isDigit).map(::transform).joinToString("")
    }
}