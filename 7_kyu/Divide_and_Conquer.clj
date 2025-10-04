(ns kata)

(defn mix->int
  "Converts string to minus decimal value of the string.
   Keeps numbers unchanged.
   Converts other arguments to nil."
  [x]
  (cond
    (string? x) (- (Integer/parseInt x))
    (number? x) x)
  )

(defn div-con
  "Sum of all numbers minus decimal values of the strings."
  [x]
  (reduce + (map mix->int x))
  )
