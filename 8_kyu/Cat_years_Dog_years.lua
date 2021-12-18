return function(years)
    if years <= 1 then 
        return { years, 15*years, 15*years }
    elseif years <= 2 then
        return { years, 15+9*(years-1), 15+9*(years-1) }
    else
        return { years, 24+4*(years-2), 24+5*(years-2) }
    end
end