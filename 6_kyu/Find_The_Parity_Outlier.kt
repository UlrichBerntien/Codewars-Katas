fun find(integers: Array<Int>): Int =
    if( integers.take(3).count {it % 2 == 0} > 1 )
        integers.first {it % 2 != 0}
    else
        integers.first {it % 2 == 0}