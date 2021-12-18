import kotlin.math.sign

fun catchSignChange(arr: Array<Int>): Int =
    arr.foldIndexed(0) {
        idx, acc, it ->
            if( idx > 0 && (it.sign > -1) != (arr[idx-1].sign > -1) )
                acc+1
            else
                acc
    }            