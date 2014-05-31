#lang planet neil/sicp

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; 代换(add-1 zero),可以发现与zero的相似之处
; zero是一个接受f为参数的函数，其返回的函数并不调用f对x处理
; 而(add-1 zero)是接受f为参数的函数，其返回的函数调用f对x运行一次
(add-1 zero)
(lambda (f) (lambda (x) (f x)))

; 下面的两个式子可以分别返回1、0，前者调用inc一次，后者不调用inc
(((add-1 zero) inc) 0)
((zero inc) 0)

; 基于上述讨论，可以定义one、two
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (compose f g) 
  (lambda (x) (f (g x))))
(define (repeated f n)
  (define (repeated-iter i comp-f)
    (if (= i n)
        comp-f
        (repeated-iter (+ i 1)
                       (compose f comp-f))))
  (repeated-iter 1 f))

(define (add n k)
  (lambda (f) (lambda (x) ((repeated f k) ((n f) x)))))

; test
(((add zero 3) inc) 0)
(((add two 3) inc) 0)