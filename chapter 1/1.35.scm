#lang racket
#|
黄金分割率满足：
x^2 = x + 1
两边同除x得：
x = 1 + 1/x
这也就是要找到一个通过映射x |-> 1 + 1/x仍然等于原x的值，
因此就是寻找x |-> 1 + 1/x的不动点
|#

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)