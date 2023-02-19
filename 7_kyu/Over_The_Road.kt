/**
 * Returns the address over the road in a up/down numbered road.
 *
 * @param address Address of the house
 * @Return address of house over the road.
 */
fun overTheRoad(address: Int, n: Int): Int {
    if (address < 1 || n * 2 < address) throw IllegalArgumentException()
    return n * 2 + 1 - address
}
