local kata = {}

kata.operations = {
    add = function(a,b) return a+b end,
    subtract = function(a,b) return a-b end,
    multiply = function(a,b) return a*b end,
    divide = function(a,b) return a/b end
}

function kata.arithmetic(a, b, operator)
    return kata.operations[operator](a,b)
end

return kata