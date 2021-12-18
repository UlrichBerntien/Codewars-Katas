package solution

import java.math.BigInteger

object Finance {

    fun finance(n: Int): BigInteger = n.toBigInteger() * (n+1).toBigInteger() * (n+2).toBigInteger() / 2.toBigInteger()
}