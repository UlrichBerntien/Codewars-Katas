object TimeFormatter {

    fun formatDuration(seconds: Int): String {
        val nameAndCount = arrayOf( Pair("second",60), Pair("minute",60), Pair("hour",24), Pair("day",365), Pair("year",Int.MAX_VALUE) )
        val acc = ArrayList<String>( nameAndCount.size )
        var n = seconds
        for( nc in nameAndCount ) {
            val i = n % nc.second
            when {
                i == 1 -> acc.add( 0, "1 ${nc.first}" )
                i  > 1 -> acc.add( 0, "${i} ${nc.first}s" )
            }
            n /= nc.second
        }
        return when(acc.size) {
            0 -> "now"
            1 -> acc[0]
            2 -> "${acc[0]} and ${acc[1]}"
            else -> acc.dropLast(2).joinToString() + ", ${acc[acc.lastIndex-1]} and ${acc[acc.lastIndex]}"
        }
    }
}