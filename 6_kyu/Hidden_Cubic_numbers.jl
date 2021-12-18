module Hidden
    export is_sum_of_cubes

    function is_cubic(n::Int)::Bool
        n == mapreduce(x -> x^3, +, digits(n))
    end

    function format_return(cubics::Vector{Int})::String
        if length(cubics) > 0
            string( join(map(x->string(x," "),cubics)), sum(cubics), " Lucky" )
        else
            "Unlucky"
        end
    end

    function is_sum_of_cubes(s::AbstractString)::String
        cubics::Vector{Int} = []
        index = 1
        while index <= length(s)
            m = match(r"\d{1,3}", s, index)
            if m !== nothing
                number = parse(Int,m.match)
                if is_cubic(number)
                    push!(cubics,number)
                end
                index = m.offset + length(m.match)
            else
                index = length(s)+1
            end
        end
        format_return(cubics)
    end

end