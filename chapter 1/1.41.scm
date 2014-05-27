#lang planet neil/sicp

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))

; 21
; (double double) 返回 (double (double f))，即运行两次double的函数
; ((double (double double)) f) 返回 (double (double (double (double f))))，即运行四次double的函数
; 每级double依次对上一级的double运行两次，则最钟调用f的次数为2*2*2*2 == 16
; 所以5+16得21
(((double (double double)) inc) 5)

