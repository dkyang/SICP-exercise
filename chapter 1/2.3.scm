#lang planet neil/sicp

; common part
(define (make-point x y)
  (cons x y))

(define (x-point x)
  (car x))

(define (y-point x)
  (cdr x))

(define (perimeter x)
  (* 2 (+ (rect-height x) (rect-width x))))

(define (area x)
  (* (rect-height x) (rect-width x)))

; first implementation of rectangle
#|
(define (make-rect left-top right-bottom)
  (cons left-top right-bottom))

(define (left-top-point x)
  (car x))

(define (right-bottom-point x)
  (cdr x))

(define (rect-height x)
  (let ((left-top (left-top-point x))
        (right-bottom (right-bottom-point x)))
    (- (y-point right-bottom) (y-point left-top))))

(define (rect-width x)
  (- (x-point (right-bottom-point x))
     (x-point (left-top-point x))))
|#

; second implementation of rectangle
(define (make-segment point1 point2)
  (cons point1 point2))

(define (start-segment x)
  (car x))

(define (end-segment x)
  (cdr x))

(define (make-rect x-segment y-segment)
  (cons x-segment y-segment))

(define (x-segment x)
  (car x))

(define (y-segment x)
  (cdr x))

(define (rect-width x)
  (let ((segment (x-segment x)))
    - (x-point (end-segment (x-segment x))) 
      (x-point (start-segment (x-segment x)))))

(define (rect-height x)
  (let ((segment (y-segment x)))
    (- (y-point (end-segment segment))
       (y-point (start-segment segment)))))

;; test
; test first implementation
#|
(define rect-test (make-rect (make-point 2 3) (make-point 4 9)))

(perimeter rect-test)

(area rect-test)

(rect-height rect-test)

(rect-width rect-test)
|#

; test second implementation
(define rect-test (make-rect (make-segment (make-point 2 3)
                                           (make-point 4 3))
                             (make-segment (make-point 2 3)
                                           (make-point 2 9))))

(perimeter rect-test)

(area rect-test)

(rect-height rect-test)

(rect-width rect-test)