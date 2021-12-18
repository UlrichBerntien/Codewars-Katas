import kotlin.math.min

fun babyCount(X: String): Int? {
    val x = X.toLowerCase()
    val n = min(min( x.count{it=='b'}/2, x.count{it=='a'}), x.count{it=='y'} )
    return if( n > 0 ) n else null
}