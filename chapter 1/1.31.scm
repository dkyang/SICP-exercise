#lang planet neil/sicp

; a)
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (define (term x) x)
  (define (inc x) (+ x 1))
  (product term 1 inc n))

(define (pi-compute a b) 
  (define (term x)
    (if (odd? x) 
        (/ (+ x 1) (+ x 2))
        (/ (+ x 2) (+ x 1))))
  (define (inc x) (+ x 1))
  (product term a inc b))

; pi
(* (pi-compute 1 100) 4.0) ; exact->inexact

; b)
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b) 
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial-iter n)
  (define (term x) x)
  (define (inc x) (+ x 1))
  (product-iter term 1 inc n))

(factorial 5)
(factorial-iter 5)



