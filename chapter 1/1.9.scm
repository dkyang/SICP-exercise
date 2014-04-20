#lang planet neil/sicp

#|
前者递归，后者迭代；
前者中间结果(累加和)由解释器记录,后者直接由变量b记录,每次迭代加1
(+ 4 5)
(inc (+ 3 5))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc 6))
(inc (inc 7))
(inc 8)
(9)

(+ 4 5)
(+ 3 6)
(+ 2 7)
(+ 1 8)
(+ 0 9)
(9)
|#
