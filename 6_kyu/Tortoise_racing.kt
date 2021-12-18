package tortoise

// return [] if v1 >= v2
fun race(v1:Int, v2:Int, g:Int):IntArray {
    val vd = v2 - v1
    if( vd > 0 ) {
        var distance = g
        val hms = IntArray(3)
        for( idx in hms.indices ) {
            hms[idx] = distance / vd
            distance = 60 * ( distance - hms[idx]*vd )
         }
         return hms
    }
    else
        return IntArray(0)
}
    