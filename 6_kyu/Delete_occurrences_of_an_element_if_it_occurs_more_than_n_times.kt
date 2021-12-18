object EnoughIsEnough {
    fun deleteNth(elements:IntArray, maxOcurrences:Int):IntArray {
        val counter = HashMap<Int,Int>(elements.size)
        val collector = ArrayList<Int>(elements.size)
        for( i in elements ) {
            val c = counter.getOrElse(i){0}
            if( c < maxOcurrences ) {
                counter[i] = c+1
                collector += i
            }
          }
    return collector.toIntArray()      
    }
}