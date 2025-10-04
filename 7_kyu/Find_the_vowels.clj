(ns vowel-indices)

(defn vowel?
  "Checks if argument is a string containing only one vowel (aeiouy)."
  [letter]
  (contains? #{\a \e \i \o \u \y \A \E \I \O \U \Y} letter))

(defn vowel-indices
  "Returns vector of index of all vowels in the word. (index 1 based!)"
  [word]
	(vec (keep-indexed #(when (vowel? %2) (inc %1)) word))
)
