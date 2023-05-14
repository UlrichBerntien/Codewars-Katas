// Converts DNA to RND code.
// Replaces 'T' with 'U', leaves all other characters unchanged.
fn dna_to_rna(dna: &str) -> String {
    dna.replace('T', "U")
}
