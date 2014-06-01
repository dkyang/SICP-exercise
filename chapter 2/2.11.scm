#lang planet neil/sicp

(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

(define (mul-interval x y)
  (define a (lower-bound x))
  (define b (upper-bound x))
  (define c (lower-bound y))
  (define d (upper-bound y))
  (let ((s1 (and (> a 0) (> b 0)))
        (s2 (and (< a 0) (> b 0)))
        (s3 (and (< a 0) (< b 0)))
        (t1 (and (> c 0) (> d 0)))
        (t2 (and (< c 0) (> d 0)))
        (t3 (and (< c 0) (< d 0))))
    (cond ((and s1 t1) (make-interval (* a c) (* b d)))
          ((and s1 t2) (make-interval (* b c) (* b d)))
          ((and s1 t3) (make-interval (* b c) (* a d)))
          ((and s2 t1) (make-interval (* a d) (* b d)))
          ((and s2 t2) (if (< (* a d) (* b c)) 
                           (make-interval (* a d) (* b d))
                           (make-interval (* b c) (* b d))))
          ((and s2 t3) (make-interval (* b c) (* a c)))
          ((and s3 t1) (make-interval (* a d) (* b c)))
          ((and s3 t2) (make-interval (* a d) (* a c)))
          ((and s3 t3) (make-interval (* b d) (* a c))))))


(define (mul-interval-ori x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

; test
(mul-interval (make-interval 1 2) (make-interval 3 4))
(mul-interval-ori (make-interval 1 2) (make-interval 3 4))

(mul-interval (make-interval 1 2) (make-interval -3 4))
(mul-interval-ori (make-interval 1 2) (make-interval -3 4))

(mul-interval (make-interval 1 2) (make-interval -4 -3))
(mul-interval-ori (make-interval 1 2) (make-interval -4 -3))

(mul-interval (make-interval -1 2) (make-interval -3 4))
(mul-interval-ori (make-interval -1 2) (make-interval -3 4))

(mul-interval (make-interval -1 2) (make-interval 3 4))
(mul-interval-ori (make-interval -1 2) (make-interval 3 4))

(mul-interval (make-interval -1 2) (make-interval -4 -3))
(mul-interval-ori (make-interval -1 2) (make-interval -4 -3))

(mul-interval (make-interval -2 -1) (make-interval 3 4))
(mul-interval-ori (make-interval -2 -1) (make-interval 3 4))

(mul-interval (make-interval -2 -1) (make-interval -3 4))
(mul-interval-ori (make-interval -2 -1) (make-interval -3 4))

(mul-interval (make-interval -2 -1) (make-interval -4 -3))
(mul-interval-ori (make-interval -2 -1) (make-interval -4 -3))