#lang planet neil/sicp

; a)
(define (cont-frac n d k)
  (define (cont-frac-recur i)
    (if (= i k)
        (/ (n i) (d i)) 
        (/ (n i) (+ (d i) (cont-frac-recur (+ i 1))))))
  (cont-frac-recur 1))

; k取11得到4位精度
(cont-frac (lambda (x) 1.0)
           (lambda (x) 1.0)
           11)
(/ 1 1.61803398875)