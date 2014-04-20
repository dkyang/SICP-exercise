#lang planet neil/sicp
;计算a+|b|

(define (pos-neg x) (if (> x 0) + -))

(pos-neg 3)
(pos-neg -3)
((pos-neg -1) 3 3)