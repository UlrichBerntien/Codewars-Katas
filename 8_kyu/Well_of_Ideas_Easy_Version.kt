fun well(x: Array<String>) =
    when (x.count { it == "good" }) {
        0 -> "Fail!"
        1,
        2 -> "Publish!"
        else -> "I smell a series!"
    }
