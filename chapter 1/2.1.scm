#lang planet neil/sicp

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(define (make-rat n d)
  (let ((g (abs (gcd n d))))
    (if (< d 0) (cons (- (/ n g)) (- (/ d g)))
        (cons (/ n g) (/ d g)))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat 1 3))
(print-rat (make-rat (- 2) (- 6)))
(print-rat (make-rat (- 1) 3))
(print-rat (make-rat 1 (- 3)))

