#lang planet neil/sicp

(define (fib n) 
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(define (fib-iter a b n)
  (if (= n 0)
      a
      (fib-iter b (+ b a) (- n 1))))
(define (fib2 n)
  (fib-iter 0 1 n))

(fib 4)
(fib2 4)

