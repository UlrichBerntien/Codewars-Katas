(ns century.core)

(defn century [year]
  (quot (+ year 99) 100))