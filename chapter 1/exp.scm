#lang planet neil/sicp

; linear recursive
(define (exp1 b n)
  (if (= n 1)
      b
      (* b (exp1 b (- n 1)))))

; linear iterative
(define (exp-iter b n acc)
  (if (= n 1)
      acc
      (exp-iter b 
                (- n 1) 
                (* acc b))))

(define (exp2 b n)
  (exp-iter b n b))

(exp1 2 3)
(exp2 2 3)