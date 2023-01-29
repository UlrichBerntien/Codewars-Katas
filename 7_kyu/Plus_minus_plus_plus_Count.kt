fun catchSignChange(arr: Array<Int>): Int =
    arr.foldIndexed(0) {
        idx, acc, it ->
            if( idx > 0 && (it >= 0) != (arr[idx-1] >= 0) )
                acc+1
            else
                acc
    }            