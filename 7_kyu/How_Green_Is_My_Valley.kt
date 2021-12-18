package valley

fun makeValley(arr:IntArray):IntArray {
    val sorted = arr.sorted()
    val N = sorted.size
    return IntArray( N ) { sorted[ if(N > 2*it) N-1-2*it else 2*it-N ] }
}