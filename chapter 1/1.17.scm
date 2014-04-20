#lang planet neil/sicp

(define (double x)
  (+ x x))
(define (half x)
  (/ x 2))

; recursive algorithm
(define (* a b)
  (cond ((= b 1) a)
        ((even? b) (double (* a (half b))))
        (else (+ a (* a (- b 1))))))


(* 3 3)
(* 8 7)
(* 3 1)
(* 7 8)
(* 1 3)


