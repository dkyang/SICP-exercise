#lang planet neil/sicp

(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter x result)
    (if (> x b)
        result
        (if (filter x) 
            (iter (next x) (combiner (term x) result))
            (iter (next x) result))))
  (iter a null-value))

; a)
(define (prime-sum a b)
  (define (term x) x)
  (define (inc x) x)
  (filtered-accumulate prime? + 0 term a inc b))

; b) assume gcd has been written
(define (coprime-product n)
  (define (term x) x)
  (define (inc x) x)
  (define (coprime x)
    (= (gcd n x) 1))
  (filtered-accumulate coprime * 1 term 1 inc n))
