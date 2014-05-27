#lang planet neil/sicp

(define dx 0.00001)
(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x))
                 dx)))

(define (newton-transform g)
  (lambda (x)
          (- x (/ (g x) ((deriv g) x)))))

(define tolerance 0.000001)

(define (fixed-point f first-guess)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (square x) (* x x))

(define (cube x) (* x x x))
(define (cubic a b c)
  (lambda (x) (+ (cube x) 
                 (* a (square x))
                 (* b x)
                 c)))
