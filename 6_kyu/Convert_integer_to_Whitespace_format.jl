function whitespacenumber(n)
    result = Char[]
    append!(result, n<0 ? '\t' : ' ' )
    if n ≠ 0
      for b in Iterators.reverse(digits(n,base=2))
          append!( result, b==0 ? ' ' : '\t' )
      end
    end
    append!(result,'\n')
    String(result)
end