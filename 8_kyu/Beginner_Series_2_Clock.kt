// Factor to convert seconds in milliseconds.
const val SECOND_MS: Int = 1000

// Factor to convert minutes in seconds.
const val MINUTE_S: Int = 60

// Factor to convert houres in minutes.
const val HOURE_M: Int = 60

// Converts time h:m:s into milliseconds.
fun past(h: Int, m: Int, s: Int) = ((h*HOURE_M + m)*MINUTE_S + s)*SECOND_MS
