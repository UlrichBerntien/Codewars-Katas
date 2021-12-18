function polydivisible(x::Int)::Bool
  accu = 0
  for (i,digit) in x |> digits |> reverse |> enumerate
    accu = muladd( accu, 10, digit )
    if accu % i != 0 return false end
  end
  return true
end