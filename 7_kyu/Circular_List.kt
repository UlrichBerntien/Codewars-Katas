class CircularList<T>(vararg val elements: T) {
    var current = -1

    init {
        if( elements.size == 0 )
            throw IllegalArgumentException("Elements required")
    }
    
    fun next(): T {
        current = if( current == -1 || current == elements.lastIndex ) 0 else current+1
        return elements[current]
    }

    fun prev(): T {
        current = if( current <= 0 ) elements.lastIndex else current-1
        return elements[current]
    }
}
