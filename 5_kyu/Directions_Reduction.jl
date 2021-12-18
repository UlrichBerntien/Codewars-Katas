module Dir
    export dir_reduc
    
    OPPOSITE = Dict( 'N' => 'S', 'S' => 'N', 'W' => 'E', 'E' => 'W' )

    function dir_reduc(arr::Array{String})::Array{String}
        workbench = String[]
        sizehint!( workbench, length(arr) )
        for next in arr
            if !isempty(workbench) && next[1]==OPPOSITE[workbench[end][1]]
                pop!(workbench)
            else
                push!(workbench, next)
            end
        end
        workbench
    end

end