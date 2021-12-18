fun argsCount(vararg args: Any): Int = when {
    args == null -> 0
    args is Array -> args.size
    else -> 1
}