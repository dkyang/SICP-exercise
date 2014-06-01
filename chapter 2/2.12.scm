#lang planet neil/sicp

(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

(define (make-center-percent center percent)
  (let ((offset (* center percent)))
    (make-interval (- center offset) (+ center offset))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (percent i)
  (/ (/ (- (upper-bound i) (lower-bound i)) 2) (center i)))

; test
(define test (make-center-percent 6.8 0.1))
(percent test)
(center test)