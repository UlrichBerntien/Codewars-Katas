fun findMissingLetter(array: CharArray): Char {
    for( index in 1..array.lastIndex )
        if( array[index-1]+1 != array[index] )
            return array[index-1]+1
    return ' '
}