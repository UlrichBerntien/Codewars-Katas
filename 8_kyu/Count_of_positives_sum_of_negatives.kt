fun countPositivesSumNegatives(input : Array<Int>?) : Array<Int> =
    if( input.isNullOrEmpty() )
        arrayOf()
    else {
        val countAndSum = arrayOf(0,0)
        for(x in input) if(x>0) countAndSum[0]++ else countAndSum[1] += x
        countAndSum
    }