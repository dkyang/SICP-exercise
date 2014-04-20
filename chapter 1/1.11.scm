#lang planet neil/sicp

(define (f1 n)
  (if (< n 3) n
      (+ (f1 (- n 1)) (* 2 (f1 (- n 2)))
         (* 3 (f1 (- n 3))))))


(define (f2 n)
  (if (< n 3) n
      (f2-iter 2 1 0 n)))

(define (f2-iter a b c n)
  (if (= n 2)
      a
      (f2-iter (+ a (* 2 b) (* 3 c))
               a 
               b
               (- n 1))))

(f1 -1)
(f2 -1)
(f1 0)
(f2 0)
(f1 3)
(f2 3)
(f1 5)
(f2 5)
