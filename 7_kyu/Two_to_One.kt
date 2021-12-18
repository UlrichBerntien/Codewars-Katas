package twotoone

fun longest(s1:String, s2:String):String =
    (s1+s2).asIterable().sorted().distinct().joinToString("")