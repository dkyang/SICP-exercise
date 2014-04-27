#lang planet neil/sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson-rule f a b n)
  (define h (/ (- b a) n))
  (define (add-h x) (+ x h))
  (define (term x) 
    ; 定义系数，由x = (a + k * h)反推得到 k = (x - a) / h
    ; 从而得到每一项f(a + k * h)前的系数
    (define (coe x) 
      (define k (round (/ (- x a) h)))
      (cond ((or (= k n) (= k 0)) 1)
            ((even? k) 2)
            (else 4)))
    (* (coe x) (f x)))
  (* (/ h 3) (sum term a add-h b)))

(define (cube b) (* b b b))

(simpson-rule cube 0 1 100)
(simpson-rule cube 0 1 1000)