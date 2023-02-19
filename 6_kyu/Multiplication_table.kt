package kata

object KataSolution {
    /**
     * Returns size x size multiplication table.
     *
     * @param size Size of the matrix to generate.
     * @return Matrix filled with row*col
     */
    fun multiplicationTable(size: Int) =
        Array(size) { x -> IntArray(size) { y -> (x + 1) * (y + 1) } }
}
