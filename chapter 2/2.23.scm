#lang planet neil/sicp


(define (for-each func l)
  (if (not (null? l)) (begin
                        (func (car l))
                        (for-each func (cdr l))
                        )))

(for-each (lambda (x) (newline) (display x))
          (list 1 2 3))

; ((lambda (x) (newline) (display x)) (car (list 1 2)))

#|
(define (test x)
  (if (> x 1) (begin
               (newline)
               (newline)
               )))

(test 2)
|#