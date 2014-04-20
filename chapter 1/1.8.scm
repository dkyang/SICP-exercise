#lang planet neil/sicp


(define (cube-iter guess x)
  (if (good-enough-quick? guess (improve guess x))
      guess
      (cube-iter (improve guess x) x)))

; approximation: (x/y^2 + 2y) / 3
(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))


(define (good-enough-quick? guess new-guess)
  (< (/ (abs (- guess new-guess)) guess) 0.01))

(define (cube x)
  (cube-iter 1.0 x))



(cube 8)
(cube 27)
