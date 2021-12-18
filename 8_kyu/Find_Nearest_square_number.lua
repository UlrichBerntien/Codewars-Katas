return {
  nearest_sq = function(n)
      if not (n > 0) then
        -- error exit
        return 0
      end
      root = math.sqrt(n)
      upper = math.ceil(root)^2
      lower = math.floor(root)^2
      if upper-n < n-lower then
        return upper
      else
        return lower
      end
    end
  }