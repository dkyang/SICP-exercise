#lang planet neil/sicp

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))


(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))



(define (div-interval x y)
  (if (and (< (lower-bound y) 0) (> (upper-bound y) 0))
      (error "y should not cross zero point")
      (mul-interval x 
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

(define (make-center-percent center percent)
  (let ((offset (* center percent)))
    (make-interval (- center offset) (+ center offset))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (percent i)
  (/ (/ (- (upper-bound i) (lower-bound i)) 2) (center i)))

; test
(define A (make-center-percent 1001 0.0001))
(define B (make-interval 342 0.1))
(par1 A A)
(par2 A A)
(newline)
(par1 A B)
(par2 A B)