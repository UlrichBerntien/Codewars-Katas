function sumtwosmallestnumbers(numbers)
    n = 2
    sum( sort(numbers, alg=PartialQuickSort(n))[1:n] )
end