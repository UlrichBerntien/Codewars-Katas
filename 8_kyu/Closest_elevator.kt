import kotlin.math.abs

fun elevator(left: Int, right: Int, call: Int): String =
    if( abs(left-call) < abs(right-call) )
        "left"
     else
         "right"