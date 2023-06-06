# Returns vector a without all items in b.
array_diff = function(a, b) a[!(a %in% b)]
