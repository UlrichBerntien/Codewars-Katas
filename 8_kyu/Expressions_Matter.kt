class Kata {
    companion object {
     
     fun expressionsMatter(a : Int, b : Int, c : Int) : Int =
         arrayOf(a+b+c,
                 a+b*c,
                 (a+b)*c,
                 a*b+c,
                 a*(b+c),
                 a*b*c).max() ?: 0
    }
}