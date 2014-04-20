#lang planet neil/sicp

(define (fact-iter product counter max-count)
  (if (< counter (+ 1 max-count)) 
      (fact-iter (* product counter) 
                (+ 1 counter)
                max-count)
      product))

(define (fact n) (fact-iter 1 1 n))

(fact 5)