fun invert(arr: IntArray): IntArray {
    val result = IntArray(arr.size)
    for( i in arr.indices ) result[i] = -arr[i]
    return result
}