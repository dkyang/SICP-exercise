#lang planet neil/sicp

; a)
(define (cont-frac1 n d k)
  (define (cont-frac-recur i)
    (if (= i k)
        (/ (n i) (d i)) 
        (/ (n i) (+ (d i) (cont-frac-recur (+ i 1))))))
  (cont-frac-recur 1))

; b)
(define (cont-frac2 n d k)
  (define (cont-frac-iter i acc)
    (if (= i 0)
        acc
        (cont-frac-iter (- i 1)
                        (/ (n i) 
                           (+ (d i) acc)))))
  (cont-frac-iter k 0))

; test
; k取11得到4位精度
(cont-frac1 (lambda (x) 1.0)
           (lambda (x) 1.0)
           11)
(cont-frac2 (lambda (x) 1.0)
           (lambda (x) 1.0)
           11)
(/ 1 1.61803398875)