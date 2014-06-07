#lang planet neil/sicp

(define (square-list-1 items)
  (if (null? items)
      nil
      (cons (* (car items) (car items))
            (square-list-1 (cdr items)))))

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (square-list-2 items)
  (map (lambda (i) (* i i)) items))

(define l (list 1 2 3 4))

(square-list-1 l)
(square-list-2 l)
