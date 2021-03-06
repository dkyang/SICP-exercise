#lang planet neil/sicp 
(define (f1 x y)
  (define (f-helper a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
  (f-helper (+ 1 (* x y))
            (- 1 y)))

(define (f2 x y)
  ((lambda (a b) 
     (+ (* x (square a))
        (* y b)
        (* a b)))
   (+ 1 (* x y))
   (- 1 y)))

(define (square a)
  (* a a))

(define (f3 x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    (+ (* x (square a)) 
       (* y b)
       (* a b))))

(define (f4 x y)
  (define a (+ 1 (* x y)))
  (define b (- 1 y))
  (+ (* x (square a))
     (* y b)
     (* a b)))

(f1 3 2)
(f2 3 2)
(f3 3 2)
(f4 3 2)
