fun evenNumbers(array: List<Int>, number: Int): List<Int> {
    val acc = array.foldRight( ArrayList<Int>(number) ) {
        it, acc -> if(acc.size < number && it % 2 == 0) acc.add(it); acc
    }
    return acc.reversed()
}