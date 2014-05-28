#lang planet neil/sicp

(define (compose f g) 
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (repeated-iter i comp-f)
    (if (= i n)
        comp-f
        (repeated-iter (+ i 1)
                       (compose f comp-f))))
  (repeated-iter 1 f))

(define (smooth f)
  ((let ((dx 0.0000001))
     (lambda (x) (/ (+ (f (- x dx))
                       (f x)
                       (f (+ x dx)))
                    3)))))

(define (smooth-n n)
  (repeated smooth n))

