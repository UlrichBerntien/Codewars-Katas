fun meeting(s: String): String =
    s.toUpperCase()
        .split(';')
        .map { it.split(':') }
        .sortedWith(compareBy({ it[1] }, { it[0] }))
        .map { "(${it[1]}, ${it[0]})" }
        .joinToString("")