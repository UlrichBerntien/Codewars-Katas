package com.codewars.a.partridge

object DoubleSort {
    fun dbSort(a: Array<Any>): Array<Any> {
        val work = a
        work.sortWith(Comparator<Any> { pa, pb ->
            when {
                pa is Int && pb is Int -> pa - pb
                pa is String && pb is String -> pa.compareTo(pb)
                pa is Int && pb is String -> -1
                pa is String && pb is Int -> +1
                else -> 0
            }
        } )
    return work
    }
}