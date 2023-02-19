// Generates Array of length n.
// Content: every 3rd item "Fizz", every 5th item "Buzz", every 15th item "FizzBuzz",
// else decimal number index+1
fun fizzBuzz(n: Int) =
    Array<String>(n) { it ->
        val i = it + 1
        when {
            i % 15 == 0 -> "FizzBuzz"
            i % 5 == 0 -> "Buzz"
            i % 3 == 0 -> "Fizz"
            else -> i.toString()
        }
    }
