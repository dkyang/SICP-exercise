#lang planet neil/sicp


(define (tan-cf x k)
  (define (tan-cf-iter i f)
    (if (not (> i k)) (/ (* x x)
                         (- (f i) 
                            (tan-cf-iter (+ i 1) f))) 
        0))
  (/ (tan-cf-iter 1 (lambda (i) (- (* 2 i) 1)))
     x))

(define pi 3.141592653)
(tan-cf (/ pi 4) 30) ; 1
(tan-cf (/ pi 3) 30) ; sqrt(3)
(tan-cf (/ pi 6) 30) ; sqrt(3) / 3


