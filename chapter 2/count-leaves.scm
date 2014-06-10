#lang planet neil/sicp

(define x (cons (list 1 2) (list 3 4)))

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(define (length x)
  (if (null? x)
      0
      (+ 1 (length (cdr x)))))



(count-leaves x)
(length x)

(count-leaves (list x x))
(length (list x x))

(count-leaves (list 1 (list 2 (list 3 4))))