#lang planet neil/sicp

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))


(define first-guess 2)

(display "without damp") ; 34
(newline)
(fixed-point (lambda (x) (/ (log 1000) (log x))) first-guess)
(newline)
(display "with damp")    ; 9
(newline)
(fixed-point (lambda (x) (/ 
                          (+ x 
                             (/ (log 1000) (log x)))
                          2)) first-guess)


