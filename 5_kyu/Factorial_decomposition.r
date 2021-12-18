decomp <- function(n) {
    factor_counts <- rep(1,n)
    names(factor_counts) <- 1:n
    factor_counts[1] <- 0
    for (index in 2:n)
        if (factor_counts[index] > 0 && 2*index <= n) {
            rest_index <- seq(2*index,n,by=index)
            while( any(factor_counts[rest_index] > 0) ) {
                dist <- factor_counts[rest_index]
                factor_counts[index] <- factor_counts[index] + sum( factor_counts[rest_index] )
                factor_counts[2:(n%/%index)] <- factor_counts[2:(n%/%index)] + dist
                factor_counts[rest_index] <- factor_counts[rest_index] - dist
            }                  
        }
    accu <- ""
    for (index in 2:n)
        if (factor_counts[index] > 0) {
            if (accu != "") accu <- paste(accu," * ",sep="")
            accu <- if(factor_counts[index] == 1)
              paste(accu,index,sep="")
            else
              paste(accu,index,"^",factor_counts[index],sep="")
        }
    return(accu)
}