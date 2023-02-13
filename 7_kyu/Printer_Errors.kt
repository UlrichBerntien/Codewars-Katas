// Returns errors statistic of s "errors/totals" (decimal numbers)
// Errors are all letters not in range 'a'..'m'.
fun printerError(s: String): String {
  val total = s.length
  val errors = s.count {it !in 'a'..'m'}
  return "$errors/$total"
}
