fun toCamelCase(str:String) =
    str.split( '-', '_' )
        .mapIndexed { idx,s -> if(idx>0) s.capitalize() else s }
        .joinToString("")