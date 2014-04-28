#lang planet neil/sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b) 
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

; 验证sum-iter
(define (inc n) (+ n 1))
(define (cube n) (* n n n))

(sum cube 2 inc 8)
(sum-iter cube 2 inc 8)