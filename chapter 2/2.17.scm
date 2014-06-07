#lang planet neil/sicp

(define (last-pair l)
  (if (null? (cdr l))
      (list (car l))
      (last-pair (cdr l))))

; test
(last-pair (list 23 72 149 34))
(list 34)
(last-pair (list 1))
(list 1)