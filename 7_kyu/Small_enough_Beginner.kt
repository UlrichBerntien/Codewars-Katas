fun smallEnough(a : IntArray, limit : Int) : Boolean  =
    a.all { it <= limit }