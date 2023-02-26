/** Power function for integers */
fun Int.pow(exp: Int): Long {
    return this.toBigInteger().pow(exp).toLong()
}

/**
 * Sum decimal digits with power.
 *
 * @param x Calculate the digit powerd sum of this int.
 * @param p The exponent of the most significant digit.
 * @return sum of all decimal digits with power p,p+1,..
 */
fun digitSum(x: Int, p: Int): Long {
    var digits = IntArray(32)
    assert( 10.pow(digits.size) > Int.MAX_VALUE.toLong() )
    var nDigits = 0
    var rest = x
    while (rest > 0) {
        digits[nDigits] = rest % 10
        rest /= 10
        nDigits++
    }
    var sum: Long = 0
    for (i in 0..nDigits - 1) {
        sum += digits[i].pow(p + nDigits - i - 1)
    }
    return sum
}

/**
 * Calculates funny integer.
 *
 * @param n Integer to analyse.
 * @param p exponent of the most significant digit in the sum.
 * @return k with k*n = powered decimal digit sum of n.
 */
fun digPow(n: Int, p: Int): Int {
    val s = digitSum(n, p)
    return if (s % n == 0L) (s / n).toInt() else -1
}
