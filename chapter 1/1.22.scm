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


(define (search-for-primes beg)
  (search-for-prime-count beg 0))
(define (search-for-prime-count n count)
  (if (< count 3)
      (begin (timed-prime-test n)
             (if (prime? n) (search-for-prime-count
                             (+ n 1)
                             (+ count 1))
                 (search-for-prime-count
                  (+ n 1)
                  count)))))

#|
不知道为什么我的电脑显示时间都为0，难道是我的电脑太快了:)
|#
(search-for-primes 1000)
#|
output:
1009 *** 0
1013 *** 0
1019 *** 0
|#

(search-for-primes 10000)
#|
10007 *** 0
10009 *** 0
10037 *** 0
|#
(search-for-primes 100000)
#|
100003 *** 0
100019 *** 0
100043 *** 0
|#
(search-for-primes 1000000)
#|
1000003 *** 0
1000033 *** 0
1000037 *** 0
|#
