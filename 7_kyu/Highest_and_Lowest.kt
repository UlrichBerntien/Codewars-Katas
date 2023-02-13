// Returns maximum and minimum of numbers.
// Argument and return are strings, the numbers separated by spaces.
fun highAndLow(numbers: String): String {
    val ints: Iterator<Int> = numbers.split(" ").map { it.trim().toInt() }.iterator()
    if (!ints.hasNext()) return ""
    var min = ints.next()
    var max = min
    for (x in ints) if (x < min) min = x else if (x > max) max = x
    return "$max $min"
}
