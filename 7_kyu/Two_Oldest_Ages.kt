package solution

fun twoOldestAges(ages: List<Int>): List<Int> {
    val oldestIdx = ages.indices.maxBy {ages[it]}
    val secondOldestIdx = ages.indices.maxBy {if(it==oldestIdx) 0 else ages[it]}
    return listOf(ages[secondOldestIdx ?: 0],ages[oldestIdx ?: 0])
}