package solution

object PositionAverage {
    
    fun posAverage(s: String): Double {
        val numbers = s.splitToSequence(",").map( String::trim ).toList()
        val numberLen = numbers[0].length
        var counterEqual = 0
        for( index in 0 until numberLen ) {
            val counterDigit = IntArray(10)
            for( it in numbers ) ++counterDigit[it[index]-'0']
            counterEqual += counterDigit.sumBy { it*(it-1)/2 }
        }
        return 200 * counterEqual.toDouble()/numbers.size/(numbers.size-1)/numberLen
    }
}
