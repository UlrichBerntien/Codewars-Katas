package dna

private val complementMap = mapOf( 'A' to 'T', 'T' to 'A', 'C' to 'G', 'G' to 'C' )

fun makeComplement(dna : String) : String {
    val acc = StringBuilder(dna.length)
    for( it in dna )
        acc.append( complementMap.getOrDefault(it,it) )
    return acc.toString()
}