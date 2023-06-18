# Returns complementary DNA string.
# Exchanges the characterxs A<->T, C<->G.
# Keeps all other characters unchanged.
DNA_strand <- function(dna) chartr("ATCG","TAGC",dna)
