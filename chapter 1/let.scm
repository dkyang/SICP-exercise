#lang planet neil/sicp 

(define x 2)

(+ (let ((x 3))
     (+ x (* x 10)))
   x)

(let ((x 3)
       (y (+ x 2)))
   (* x y))
