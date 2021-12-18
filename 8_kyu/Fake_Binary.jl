function fakebin(x)
    buffer = IOBuffer(maxsize=sizeof(x))
    for c in x write( buffer, c < '5' ? '0' : '1' ) end
    String(take!(buffer))
end