package accum

fun accum(s:String) =
    s
    .mapIndexed { idx,c -> c.toUpperCase().toString() + c.toLowerCase().toString().repeat(idx) }
    .joinToString("-")
