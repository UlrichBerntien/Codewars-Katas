package sumofparts

fun sumParts(ls: IntArray): IntArray {
    val sums = IntArray( ls.size+1 )
    for( i in ls.size-1 downTo 0 )
        sums[i] = ls[i] + sums[i+1]
    return sums
}