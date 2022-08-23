(local {: tbl? : nil? : num?} (require :lib.types))
(fn keys [t]
  (let [result []]
    (when t
      (each [k _ (pairs t)]
        (table.insert result k)))
    result))

(lambda empty? [xs]
  "Check if given table is empty"
  (assert-compile (tbl? xs) "expected table for xs" xs)
  (= 0 (length xs)))

(lambda first [xs]
  "Get the first element in a list"
  (assert-compile (tbl? xs) "expected table for xs" xs)
  (. xs 1))

(lambda second [xs]
  "Get the second element in a list"
  (assert-compile (tbl? xs) "expected table for xs" xs)
  (. xs 2))

(lambda last [xs]
  "Get the last element in a list"
  (assert-compile (tbl? xs) "expected table for xs" xs)
  (. xs (length xs)))

(lambda count [xs]
  "Count the number of items in a table"
  (if
    (table? xs) (let [maxn (table.maxn xs)]
                  (if (= 0 maxn)
                    (table.maxn (keys xs))
                    maxn))
    (not xs) 0
    (length xs)))

(lambda any? [pred xs]
  (accumulate [any? false
               _ v (ipairs xs)
               :until any?]
    (pred v)))

(lambda all? [pred xs]
  (not (any? #(not (pred $)) xs)))

(lambda contains? [xs x]
  (any? #(= $ x) xs))

(lambda flatten [x ?levels]
  (assert (tbl? x) "expected tbl for x")
  (assert (or (nil? ?levels) (num? ?levels)) "expected number or nil for levels")
  (if (or (nil? ?levels) (> ?levels 0))
    (accumulate [output []
                 _ v (ipairs x)]
      (if (tbl? v)
        (icollect [_ v (ipairs (flatten v (if (nil? ?levels) nil (- ?levels 1)))) :into output] v)
        (doto output (table.insert v))))
    x))

{
 : keys
 : empty?
 : first
 : second
 : last
 : count
 : any?
 : all?
 : contains?
 : flatten}
