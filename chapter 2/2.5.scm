#lang planet neil/sicp

(define (cons a b) (* (expt 2 a) (expt 3 b)))

(define (fact-power x fact)
  (define (fact-power-iter x k)
    (if (= (remainder x fact) 0)
        (fact-power-iter (/ x fact) (+ k 1))
        k))
  (fact-power-iter x 0))

(define (car x)
  (fact-power x 2))

(define (cdr x)
  (fact-power x 3))

; test
(define test (cons 4 9))
(car test)
(cdr test)