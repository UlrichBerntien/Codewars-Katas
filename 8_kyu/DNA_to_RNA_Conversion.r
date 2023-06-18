# Converts string DNA to RNA.
# Means replaced all character T by character U.
dna_to_rna <- function(dna) chartr("T","U",dna)
