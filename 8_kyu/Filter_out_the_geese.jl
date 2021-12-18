const GEESE = ["African", "Roman Tufted", "Toulouse", "Pilgrim", "Steinbacher"]

goosefilter(birds) = filter( x -> x ∉ GEESE, birds )