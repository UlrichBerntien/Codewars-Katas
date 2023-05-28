"Maximal result for positive a,b,c"
expressionsmatter(a, b, c) = max( maxop(maxop(a,b),c), maxop(a,maxop(b,c)) )

"Maximal result after + or *."
maxop(x,y) = max(x+y,y*x)