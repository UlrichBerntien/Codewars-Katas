public class MixedSum {

    public fun sum(mixed: List<Any>): Int = mixed.sumBy {
        when(it) {
            is Int -> it
            is String -> it.toInt()
            else -> 0
        }
    }
    
}