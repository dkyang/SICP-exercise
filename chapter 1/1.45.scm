#lang planet neil/sicp

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

(define (average x y) (/ (+ x y) 2))
(define (average-damp f)
  (lambda (x) (average x (f x))))


(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))

(define (cube x)
  (fixed-point (average-damp (lambda (y) (/ x (* y y)))) 1.0))

(define (4-times-square x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y))))) 1.0))

(define (5-times-square x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y y))))) 1.0))

(define (6-times-square x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y y y))))) 1.0))

(define (7-times-square x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y y y y))))) 1.0))

(define (8-times-square x)
  (fixed-point (average-damp 
                (average-damp (average-damp (lambda (y) (/ x (* y y y y y y y)))))) 1.0))

(define (10-times-square x)
  (fixed-point (average-damp (average-damp (average-damp 
                                            (lambda (y) (/ x (* y y y y y y y y y)))))) 1.0))

(define (13-times-square x)
  (fixed-point (average-damp (average-damp (average-damp 
                                            (lambda (y) (/ x (* y y y y y y y y y y y y)))))) 1.0))

(define (15-times-square x)
  (fixed-point (average-damp (average-damp (average-damp 
                                            (lambda (y) (/ x (* y y y y y y y y y y y y y y)))))) 1.0))

(define (16-times-square x)
  (fixed-point (average-damp 
                (average-damp 
                 (average-damp 
                  (average-damp 
                   (lambda (y) (/ x (* y y y y y y y y y y y y y y y))))))) 1.0))

; 2,3 - 1 
; 4,5,6,7 - 2
; 8,9,10,11,12,13,14,15 - 3
#|
(sqrt 4)
(cube 8)
(4-times-square 16)
(5-times-square 32)
(6-times-square 64)
(7-times-square 128)
(8-times-square 256)
(10-times-square 1024)
(13-times-square 8192)
(15-times-square 32768)
(16-times-square 65536)
|#

(define (compose f g) 
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (repeated-iter i comp-f)
    (if (= i n)
        comp-f
        (repeated-iter (+ i 1)
                       (compose f comp-f))))
  (repeated-iter 1 f))

#|
; 以下两个函数等价
(define (n-times-square x n)
  (define (multi-n y n)
    ((repeated (lambda (x) (* x y)) n) 1))
  (fixed-point ((repeated average-damp (find-average-damp-time n))
                (lambda (y) (/ x (multi-n y (- n 1)))))
               1.0))
|#
(define (n-times-square x n)
  (fixed-point ((repeated average-damp (find-average-damp-time n))
                (lambda (y) (/ x ((repeated (lambda (z) (* z y)) (- n 2)) y))))
               1.0))

(define (find-average-damp-time n)
  (define (find-iter val i)
    (cond ((> val n) (- i 1))
          ((= val n) i)
          (else (find-iter (* val 2) (+ i 1)))))
  (find-iter 2 1))
#|
(find-average-damp-time 15)
(find-average-damp-time 8)
(find-average-damp-time 7)
(find-average-damp-time 4)
(find-average-damp-time 2)
|#

(n-times-square 65536 16)
(n-times-square 32768 15)
(n-times-square 8192 13)
(n-times-square 1024 10)
(n-times-square 64 6)
(n-times-square 16 4)
(n-times-square 32768 15)
(n-times-square (* 65536 1024) 26)