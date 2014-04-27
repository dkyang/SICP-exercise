#lang planet neil/sicp

(define (test-fermat n)
  (test-congruent n 1))

(define (test-congruent n a)
  (if (< a n) 
      (if (= (expmod a n n) a)
          (test-congruent n (+ a 1)) false)
      true))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else 
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square n)
  (* n n))


; 用于比较，最小除数法
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))


(test-fermat 561)
(test-fermat 1105)
(test-fermat 1729)
(test-fermat 2465)
(test-fermat 2821)
(test-fermat 6601)

(prime? 561)
(prime? 1105)
(prime? 1729)
(prime? 2465)
(prime? 2821)
(prime? 6601)