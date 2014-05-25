#lang planet neil/sicp

(define (cont-frac n d k)
  (define (cont-frac-iter i acc)
    (if (= i 0)
        acc
        (cont-frac-iter (- i 1)
                        (/ (n i) 
                           (+ (d i) acc)))))
  (cont-frac-iter k 0))

(define (divisible-by? n k)
  (= (remainder n k) 0))

(define (compute-exp k) 
  (+ 2
     (cont-frac (lambda (i) 1.0)
                (lambda (i) (if (divisible-by? i 3)
                                (* 2 (/ (+ i 1) 3))
                                1.0))
                k)))

(compute-exp 15)
