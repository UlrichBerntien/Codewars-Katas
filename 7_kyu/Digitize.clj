(ns kata)

(defn digitize
  "Converts number to array of decimal digits. (ignores sign)"
  [n]
  (cond
    (neg? n) (digitize (- n))
    (< n 10) [n]
    :else (conj (digitize (quot n 10)) (mod n 10))
    )
)