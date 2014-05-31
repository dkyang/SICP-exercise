#lang planet neil/sicp

(define (make-segment point1 point2)
  (cons point1 point2))

(define (start-segment x)
  (car x))

(define (end-segment x)
  (cdr x))

(define (make-point x y)
  (cons x y))

(define (x-point x)
  (car x))

(define (y-point x)
  (cdr x))


(define (midpoint-segment segment)
  (define (average x y) (/ (+ x y) 2))
  (let ((start-point (start-segment segment))
        (end-point (end-segment segment)))
    (make-point (average (x-point start-point)
                         (x-point end-point))
                (average (y-point start-point)
                         (y-point end-point)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))

(define segment-1 (make-segment (make-point 1 5) (make-point 3 8)))
(print-point (midpoint-segment segment-1))