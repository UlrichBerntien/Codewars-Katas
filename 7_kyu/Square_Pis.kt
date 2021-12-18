package algos
import kotlin.math.*

fun squarePi(digits: Int): Int {
    val PI = "31415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679"
    val sum = PI.take(digits).sumByDouble { (it-'0').toDouble().pow(2) }
    return ceil(sqrt(sum)).toInt()
}