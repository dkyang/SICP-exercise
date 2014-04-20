#lang planet neil/sicp

(define (double x)
  (+ x x))
(define (half x)
  (/ x 2))

; iterative algorithm,不变量为a * b + c
(define (*iter a b c)
  (cond ((= b 0) c)
        ((even? b) (*iter (double a) (half b) c))
        (else (*iter a (- b 1) (+ c a)))))
(define (*_1 a b)
  (*iter a b 0))

(*_1 3 3)
(*_1 8 7)
(*_1 3 1)
(*_1 7 8)
(*_1 1 3)
