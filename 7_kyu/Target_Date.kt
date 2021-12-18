package target
import java.time.LocalDate
import kotlin.math.*

fun dateNbDays(a0:Double, a:Double, p:Double):String {
    val base = 1 + p/36000
    val days = ceil( ln(a/a0) / ln(base) ).toLong()
    return LocalDate.of(2016,1,1).plusDays(days).toString()
}