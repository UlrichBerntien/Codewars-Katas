package solution

object StockList {
    fun stockSummary(lstOfArt: Array<String>, lstOfCat: Array<String>): String {
        if (lstOfArt.isEmpty() || lstOfCat.isEmpty())
            return ""
        fun parseArt(str: String) : Pair<Char,Int> {
            val (c,n) = str.split(" ");
            return Pair(c[0],n.toInt());
            }
        val lstOfStock = lstOfArt.map( ::parseArt )
        return lstOfCat
            .map { cat -> Pair(cat,lstOfStock.map {if(cat[0] == it.first) it.second else 0}.sum()) }
            .map { (cat,sum) -> "($cat : $sum)" }
            .joinToString(" - ")
    }
}