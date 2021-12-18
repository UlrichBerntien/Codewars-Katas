function finalgrade(exam::Number, projects::Number)::Int
    if exam > 90 || projects > 10
        100
    elseif exam > 75 && projects ≥ 5
        90
    elseif exam > 50 && projects ≥ 2
        75
    else
        0
     end
end