kata = {}
function kata.circleOfNumbers(n, firstNumber)
    return ( firstNumber + n // 2 ) % n
end
return kata