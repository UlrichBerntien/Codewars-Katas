module BoolWord
    export bool_to_word 
    bool_to_word(boolean::Bool)::String = ifelse( boolean, "Yes", "No" )
end 