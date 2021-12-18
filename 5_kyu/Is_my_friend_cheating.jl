module Friend
    export remove_nb

    function remove_nb(n)
        Σ = (n*(n+1)) ÷ 2
        result = Tuple{Int64,Int64}[]
        for a in 1:n
            b = ((Σ+1)÷(a+1))-1
            if 1 ≤ b ≤ n && Σ-a-b == a*b
                push!( result, (a,b) )
            end
        end
        result
    end  

end    