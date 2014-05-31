#lang planet neil/sicp

(define (iterative-improve good-enough? improve)
  (define (try x) (if (good-enough? x)
                       x
                      (try (improve x))))
  (lambda (i) (try i)))

(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))
(define (sqrt-iter x first-guess)
  ((iterative-improve (lambda (i) (< (abs (- (square i) x)) 0.0001))
                     (lambda (i) (average i (/ x i)))) first-guess))

(define (fixed-point f first-guess)
  ((iterative-improve (lambda (i) (< (abs (- i (f i))) 0.0001))
                      (lambda (i) (f i))) first-guess))

(define (sqrt-1 x)
  (sqrt-iter x 1.0))
(define (sqrt-2 x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))

(sqrt 36)
(sqrt-2 3)

