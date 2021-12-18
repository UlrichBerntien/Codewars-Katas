: add ( x y -- sum )
    \ Addition of bit a and bit b results in two bits CD
    \    a + b = CD
    \ with D = a XOR b, C = a AND b
    begin
        2dup xor
        -rot and 2*
        dup 0=
    until
    drop
;