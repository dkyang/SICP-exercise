#lang planet neil/sicp

#|
; 通过如下代换可以发现，(car (cons x y))确实可以得到x
(car (cons x y))
((cons x y) (lambda (p q) p))
((lambda (p q) p) x y)
(x)
|#
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))
; test
(define test (cons 1 2))
(car test)
(cdr test)
