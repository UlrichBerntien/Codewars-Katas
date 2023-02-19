/** Cuts integer value to range 0..255 of a byte */
fun cutToByte(x: Int) =
    when {
        x > 0xff -> 0xff
        x < 0 -> 0
        else -> x
    }

/** Formats rgb channel values into hex color string */
fun rgb(r: Int, g: Int, b: Int) = "%02X%02X%02X".format(cutToByte(r), cutToByte(g), cutToByte(b))
