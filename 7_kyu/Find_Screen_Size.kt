fun findScreenHeight(width: Int, ratio: String): String {
    val (rWidth, rHeight) = ratio.split(":").map { it.toInt() }
    return "${width}x${width*rHeight/rWidth}"
}