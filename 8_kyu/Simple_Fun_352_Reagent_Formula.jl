function isvalid(formula)
    material = falses(8)
    for it in formula
        material[it] = true
    end
    ! ( material[1] & material[2] ) &
    ! ( material[3] & material[4] ) &
    ( material[5] == material[6] ) &
    ( material[7] | material[8] )
end