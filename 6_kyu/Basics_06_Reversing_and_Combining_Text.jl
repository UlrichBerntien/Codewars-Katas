function reverseandcombinetext(str::String)::String
    words = split(str,' ')
    # standard word sequence
    index = collect(1:lastindex(words))
    # calculate the reverseandcombine word sequence
    blocksize = 1
    while blocksize < lastindex(words)
        for bindex = 1:blocksize:lastindex(words)
            block = bindex:min(lastindex(words),bindex+blocksize-1)
            index[block] = -reverse(index[block])
        end
        blocksize *= 2
    end
    # combine the words
    buffer = IOBuffer(maxsize=length(str))
    for i in index
        write( buffer, i < 0 ? reverse(words[-i]) : words[i] )
    end
    String(take!(buffer))
end