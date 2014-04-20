#lang planet neil/sicp

; base^exp % m 
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else 
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

; 通过fermat-test说明可能是素数，若没通过则必然不是
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

; 重复一定次数的fermat-test，只要又一次不满足就不是素数
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- time 1)))
        (else false)))