#lang planet neil/sicp

(define (square n)
  (* n n))
(define (find-divisor n a)
  (cond ((> (square a) n) n)
        ((= (remainder n a) 0) a)
        (else (find-divisor n (+ a 1)))))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (prime? n)
  ( = (smallest-divisor n) n))

#|
(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)
|#

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (prime-test n count)
  (if (> count 0)
      if ()))
(define (time-test n)
  ())
(timed-prime-test 1000)
(timed-prime-test 10000)
(timed-prime-test 100000)
(timed-prime-test 1000000)
