function switcheroo(input::AbstractString)::String
    translation = Dict('a'=>'b','b'=>'a','c'=>'c')
    string( map(c->translation[c], input) )
end