# Calculates arithmetic mean value of the samples without outliers.
# Outliers are samples with distance to mean > cutoff*population standard deviation.
clean_mean <- function(sam, cutoff){
  n <- 1L
  subset <- sam
  m <- mean(subset)
  repeat {
    s <- sd.population(subset)
    subset <- subset[abs(subset-m) <= cutoff * s]
    m_next <- mean(subset)
    if( abs(m-m_next) < 1e-5*max(1,abs(m)) | n > 10L ) break
    n <- n + 1L
    m <- m_next
  }
  round(m,digits=2)
}

# Standard deviation of the population
sd.population = function(x) sd(x)*sqrt((length(x)-1)/length(x))
