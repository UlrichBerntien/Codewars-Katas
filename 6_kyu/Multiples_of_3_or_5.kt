fun gauss(last :Int): Int = (last*(last+1))/2

fun solution(number: Int): Int = 3*gauss((number-1)/3) + 5*gauss((number-1)/5) - 15*gauss((number-1)/15)
    