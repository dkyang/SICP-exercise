#lang planet neil/sicp

(define (compose f g) 
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (repeated-iter i comp-f)
    (if (= i n)
        comp-f
        (repeated-iter (+ i 1)
                       (compose f comp-f))))
  (repeated-iter 1 f))

(define (square x) (* x x))

((repeated square 2) 5)
((repeated (lambda (x) (+ x 1)) 5) 0)

(define (multi-n y n)
  ((repeated (lambda (x) (* x y)) n) 1))

(multi-n 3 4)