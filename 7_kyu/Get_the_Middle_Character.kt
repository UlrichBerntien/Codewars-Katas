package middle

fun getMiddle(word: String): String = word.substring( (word.length-1)/2 .. word.length/2 )