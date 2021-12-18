package divseven

fun seven(n:Long):LongArray {
    var counter = 0L
    var m = n
    while( m > 99 ) {
        m = (m/10) - 2*(m%10)
        ++counter
    }
    return longArrayOf(m, counter)
}