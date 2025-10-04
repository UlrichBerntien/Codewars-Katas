(ns kata)

(defn decimal-digits
  "Generate list of all decimal digits as numbers, least digit first."
  [number]
  (cond
    (neg? number) (decimal-digits (- number))
    (< number 10) (list number)
    :else (conj (decimal-digits (quot number 10)) (mod number 10)))
  )


; abs function was added in Clojure 1.11.0
(defn abs
  "Absolute value"
  [x]
  (if (neg? x) (- x) x)
  )


(defn decimal-distance
  "Distance between two decimal digits."
  [a b]
  ; examples: 3-2 is 1, 0-9 is 1.
  (mod (abs (- a b)) 9)
  )


(defn jumping-number?
  "Checks if the number ia a jumping number? (Distance of all adjacent digits is 1)"
  [number]
  (let [digits (decimal-digits number)]
    ; all distance between digits must be 1
    (apply = (cons 1 (map decimal-distance digits (rest digits))))
    )
  )


(defn jumping-number [number]
  (if (jumping-number? number) "Jumping!!" "Not!!")
  )
