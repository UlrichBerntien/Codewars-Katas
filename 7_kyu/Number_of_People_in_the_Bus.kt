fun people(busStops: Array<Pair<Int, Int>>) : Int = busStops.sumBy { it.first - it.second }