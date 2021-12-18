module Color
    export checkchoose

    function checkchoose(m::Number, n::Integer)::Integer
        if m ≤ 0 || n ≤ 0
            # No solution
            return -1
        end
        if m == 1
            # special case, no handle by array of faculties
            return 0
        end
        faculty = Array{BigInt}(n)
        faculty[1] = 1
        for idx=2:n faculty[idx] = faculty[idx-1]*idx end
        # condition for x: m = n! / (x! * (n - x)!)
        # ⇔ x! * (n - x)! = n! / m
        if faculty[n] % m > 0
            return -1
        end
        target = faculty[n] ÷ m
        for x = 1:n÷2+1
            if faculty[x]*faculty[n-x] == target
                return x
            end
        end
        # No solution found
        -1
    end

end