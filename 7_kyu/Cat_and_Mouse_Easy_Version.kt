package catmouse

fun catMouse(s: String): String
        = if(s.matches("C\\.{0,3}m".toRegex())) "Caught!" else "Escaped!"