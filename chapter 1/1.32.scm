#lang planet neil/sicp

#|
sum和product计算过程都是在一个范围内，迭代得用前面若干项的累积计算结果与当前项运算，
得到当前的累积计算结果，二者只是计算累积结果的运算方式不同，其实有着相同的模式。
|#

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner 
                            null-value 
                            term 
                            (next a)
                            next
                            b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter x result)
    (if (> x b)
        result
        (iter (next x) (combiner result (term x)))))
  (iter a null-value))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

(define (product-iter term a next b)
  (accumulate-iter * 1 term a next b))

; for testing
(define (factorial n)
  (define (term x) x)
  (define (inc x) (+ x 1))
  (product term 1 inc n))

(define (sum-integer a b)
  (define (term x) x)
  (define (inc x) (+ x 1))
  (sum term a inc b))

(define (factorial-iter n)
  (define (term x) x)
  (define (inc x) (+ x 1))
  (product-iter term 1 inc n))

(define (sum-integer-iter a b)
  (define (term x) x)
  (define (inc x) (+ x 1))
  (sum-iter term a inc b))


(factorial 5)
(factorial-iter 5)
(sum-integer 2 5)
(sum-integer-iter 2 5)

