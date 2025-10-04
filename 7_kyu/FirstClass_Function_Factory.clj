(ns first-class-function-factory)

(defn factory
  "Generate a function: multiply all numbers in the array by x."
  [x]
  (fn [arr] (vec (map #(* x %) arr)))
  )
