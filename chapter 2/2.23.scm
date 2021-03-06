#lang planet neil/sicp


(define (for-each func l)
  (if (not (null? l)) (begin
                        (func (car l))
                        (for-each func (cdr l))
                        )))

(for-each (lambda (x) (newline) (display x))
          (list 1 2 3))
