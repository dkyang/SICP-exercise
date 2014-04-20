#lang planet neil/sicp

; 不变量a*b^n
(define (fast-exp-iter b n a)
  (cond ((= n 0) a)
         ((even? n) (fast-exp-iter (* b b)
                                  (/ n 2)
                                  a))
         (else (fast-exp-iter b 
                              (- n 1)
                              (* b a)))))
(define (fast-exp b n)
  (fast-exp-iter b n 1))

(fast-exp 3 1)
(fast-exp 3 3)
(fast-exp 3 4)

