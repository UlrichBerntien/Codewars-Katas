module Mumbling
    export accum

    function accum(s::AbstractString)::String
        accu = IOBuffer()
        for (index, chr) in enumerate(s)
          if index > 1
            write(accu,'-')
          end
          write(accu,titlecase(chr^index))
        end
        return String(take!(accu))
    end

end