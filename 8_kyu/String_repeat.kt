fun repeatStr(r: Int, str: String) : String {
    val acc = StringBuilder(r*str.length)
    repeat(r) { acc.append(str) }
    return acc.toString()
}