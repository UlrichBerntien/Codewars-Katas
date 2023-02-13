fun prevMultOfThree(n: Int): Int? {
    var x = n
    while( x % 3 > 0 ) x /= 10
    return if( x > 0 ) x else null
}
