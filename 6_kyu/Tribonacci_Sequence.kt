fun tribonacci(signature: DoubleArray, n: Int): DoubleArray {
    val tribonacci_sequence = sequence {
        yieldAll(signature.asIterable())
        val last3 = Array<Double>(3) { signature[it] }
        var current = 0
        while (true) {
            // The 3 summands must be in this order!
            // Add the summands in a different order like last3[current] = last3.reduce { acc, x -> acc + x }
            // will not pass the radom test cases because the rounding errrors are different.
            last3[current] = last3[current] + last3[(current + 1) % 3] + last3[(current + 2) % 3]
            yield(last3[current])
            current = (current + 1) % 3
        }
    }
    val iter = tribonacci_sequence.iterator()
    return DoubleArray(n) { _ -> iter.next() }
}