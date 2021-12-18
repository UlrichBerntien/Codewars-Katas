: potatoes ( p0 w0 p1 -- w )
    \ dry mass T is constant
    \ before T = w0 (1 - p0/100)
    \ after  T = w1 (1 - p1/100)
    \ =>     w1 (1 - p1/100) = w0 (1 - p0/100)
    \ =>     w1 = w0 * (100 - p0)/(100 - p1)
    \ =>     w1 = w0 * (p0 - 100)/(p1 - 100)
  rot 100 - rot * swap 100 - /  
;