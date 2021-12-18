package solution

import java.math.BigDecimal
import java.text.DecimalFormat
import java.util.*

object OrdersSummary {

    private val simpleOrderFormat = Regex("""\s*(\S+)\s+(\d+)\s+(\d+(?:\.\d*))\s+([SB])\s*""")

    private val sellStatus = "S"

    private val priceFormat = DecimalFormat("#")

    fun balanceStatements(lst: String): String {
        var accBuy = BigDecimal(0)
        var accSell = BigDecimal(0)
        val accBadly = LinkedList<String>()
        for (simpleOrder in lst.splitToSequence(",")) {
            val match = simpleOrderFormat.matchEntire(simpleOrder)
            if (match != null) {
                val quantity = BigDecimal(match.groupValues[2])
                val price = BigDecimal(match.groupValues[3])
                val status = match.groupValues[4]
                val totalPrice = quantity * price
                if (status == sellStatus)
                    accSell += totalPrice
                else
                    accBuy += totalPrice
            } else if (!simpleOrder.isNullOrBlank()) {
                accBadly.add(simpleOrder.trim())
            }
        }
        val badly = if (accBadly.isEmpty())
            ""
        else
            "; Badly formed ${accBadly.size}: " + accBadly.joinToString(" ;") + " ;"
        return "Buy: ${priceFormat.format(accBuy)} Sell: ${priceFormat.format(accSell)}${badly}"
    }
}
