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

; 通过fermat-test说明可能是素数,若没通过则必然不是
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

; 重复一定次数的fermat-test,只要又一次不满足就不是素数
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (square n)
  (* n n))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 221)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


(define (search-for-primes beg)
  (search-for-prime-count beg 0))
(define (search-for-prime-count n count)
  (if (< count 3)
      (begin (timed-prime-test n)
             (if (fast-prime? n 221) (search-for-prime-count
                             (+ n 1)
                             (+ count 1))
                 (search-for-prime-count
                  (+ n 1)
                  count)))))

; 为什么fast-prime?反而耗时更久？
; output: 
(search-for-primes 1000)
#|
1009 *** 1000
1013 *** 1000
1019 *** 1000
|#
(search-for-primes 10000)
#|
10007 *** 1000
10009 *** 1000
10037 *** 2000
|#
(search-for-primes 100000)
#|
100003 *** 1000
100019 *** 2000
100043 *** 2000
|#
(search-for-primes 1000000)
#|
1000003 *** 1000
1000033 *** 2000
1000037 *** 2000
|#
