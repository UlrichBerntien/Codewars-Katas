// Returns the product of all decimal digits of num.
private fun productOfDigits(num: Int): Int {
    var accu = num % 10
    var x = num / 10
    while (x > 0) {
        accu *= x % 10
        x /= 10
    }
    return accu
}

// Returns the multiplicative persistence of num.
fun persistence(num: Int): Int {
    var rounds = 0
    var x = num
    while (x > 9) {
        rounds++
        x = productOfDigits(x)
    }
    return rounds
}
