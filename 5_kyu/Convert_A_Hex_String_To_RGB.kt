// you have preloaded 
// data class RGB(val r: Int, val g: Int, val b: Int)
fun hexStringToRGB(hexString: String): RGB {
    if(!hexString.matches(Regex("""^#\p{XDigit}{6}$""")))
        throw IllegalArgumentException("RGB format error '$hexString'")
    fun hex(start:Int) = hexString.substring(start,start+2).toInt(16)
    return RGB( r = hex(1), g = hex(3), b = hex(5) )
}