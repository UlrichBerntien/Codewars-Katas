fun rangeExtraction(arr: IntArray): String {

    data class myIntRange(val start: Int, var count: Int = 1 ) {
        override fun toString() : String = when(count) {
            1 -> start.toString()
            2 -> "${start},${start+1}"
            else -> "${start}-${start+count-1}"
        }       
        fun isNext(i: Int) : Boolean = start+count == i
        fun add() { count++ }
    }

    val acc = ArrayList<myIntRange>()
    for( i in arr )
        if( !acc.isEmpty() && acc.last().isNext(i) )
            acc.last().add()
        else
            acc.add( myIntRange(i) )
    return acc.joinToString(",")
}