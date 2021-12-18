import Unicode

mouthsize(animal) = Unicode.normalize(animal, casefold=true) == "alligator" ? "small" : "wide"