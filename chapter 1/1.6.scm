#lang planet neil/sicp


#|
对应用序的理解，虽然cond是运行到条件测试为真时为止，但new-if是一个procedure，
无论测试条件为何值，两个实参（then-clause和else-clause）都会被求值，所以递归不会停止。
|#

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))


(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))


(define (square x)
  (* x x))

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (new-sqrt-iter (improve guess x)
                     x)))
(new-sqrt-iter 1.0 3)
