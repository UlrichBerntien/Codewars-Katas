package solution

object DirReduction {

    // Map each direction to the opposite direction
    val opposite =
        hashMapOf("NORTH" to "SOUTH", "SOUTH" to "NORTH", "EAST" to "WEST", "WEST" to "EAST")

    // Returns reduced direction array skipping all opposite direction pairs in the array.
    fun dirReduc(arr: Array<String>): Array<String> {
        var accu = mutableListOf<String>()
        arr.onEach {
            if (accu.isEmpty() || !(accu.last() == opposite[it])) accu.add(it)
            else accu.removeLast()
        }
        return accu.toTypedArray()
    }
}
