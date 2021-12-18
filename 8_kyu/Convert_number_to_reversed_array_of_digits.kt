object Kata {
  fun digitize(n:Long):IntArray {
      var rest = n
      val collector = mutableListOf<Int>()
      do {
          collector.add( (rest%10).toInt() )
          rest /= 10
      } while( rest > 0 )
      return collector.toIntArray()
  }
}