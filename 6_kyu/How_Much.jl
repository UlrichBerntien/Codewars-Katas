module How
    export howmuch

    function howmuch(m::Int, n::Int)::Array{Tuple{String,String,String}}
        min_value, max_value = minmax(m,n)
        # Only values "37+63idx" are possible
        idx_to_value(idx) = 37 + 63idx
        value_to_idx(v) = (v - 37) / 63
        min_idx = ceil(Int,value_to_idx(min_value))
        max_idx = floor(Int,value_to_idx(max_value))
        result = []
        for idx = min_idx:max_idx
            money = idx_to_value(idx)
            boat_cost = money ÷ 7
            car_cost = money ÷ 9
            push!(result, ("M: $money","B: $boat_cost","C: $car_cost") )
        end
        result
    end

end