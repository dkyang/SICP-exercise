#lang planet neil/sicp

(define (same-parity x . y)
  (define (odd? i) (= (remainder i 2) 1))
  (define (even? i) (= (remainder i 2) 0))
  (define (extract-parity l predict)
    (if (null? l) nil
        (if (predict (car l))
            (cons (car l)
                  (extract-parity (cdr l) predict))
            (extract-parity (cdr l) predict))))
  (cons x (extract-parity y (if (odd? x) odd? even?))))  
  ;(let ((extract-func (if (odd? x) odd? even?)))
  ;  (cons x (extract-parity y extract-func))))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
