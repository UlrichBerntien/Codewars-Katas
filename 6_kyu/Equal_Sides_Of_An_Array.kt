object EqualSidesOfAnArray {
    /**
     * Finds index with same item sum right and left of the item. Limitation: Sum and all parital
     * sums must be in the Int range.
     *
     * @param arr Search in this array
     * @returns index with sum(arr[..index-1]) == sum(arr[index+1..]) or -1.
     */
    fun findEvenIndex(arr: IntArray): Int {
        val total = arr.sum()
        var accu = 0
        return arr.indexOfFirst { it ->
            val cmp = 2 * accu == total - it
            accu += it
            cmp
        }
    }
}
