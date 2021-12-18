adjacentelementsproduct(array) =
    maximum( v -> v[1]*v[2], zip(array,array[2:end]) )