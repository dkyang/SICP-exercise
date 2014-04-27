#lang planet neil/sicp

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (if (？？) 0 (remainder (square (expmod base (/ exp 2) m)) ; 未通过non-trival测试返回0，否则继续计算
                    m)))
        (else 
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square n)
  (* n n))


(define (miller-rabin-test n)
  (define (try-it a)
    (define val (expmod a (- n 1) n)) ; a^(n-1) is congruent to 1 modulo n
    (= val 1)) ; expmod结果为1时通过测试
  (try-it (+ 1 (random (- n 1)))))

; 重复一定次数的fermat-test,只要又一次不满足就不是素数
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))