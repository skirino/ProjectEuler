(defn divisible_by_3_or_5? [x] (or (= 0 (mod x 3)) (= 0 (mod x 5))))
(println (reduce + (filter divisible_by_3_or_5? (range 1 1000))))
