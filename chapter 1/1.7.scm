#lang planet neil/sicp
#|
当数字很小时，首先需要注意的是应该讲good-enough?函数中的数字减小，
否则无法得到正确的结果，这是由于当该值过大时精度过低，相对真实结果来说差异太大。
另外计算中间结果与原有猜想的比值在每次迭代中的变化较小，
导致每次的improve过程基本是将原有猜想值除2以得到新的猜想，
这样会有较多的迭代次数，从而算法的效率较低。
|#

#|
如果数字很大，由于计算机精度的限制，小数部分的精度不够，
导致迭代过程中猜想的数字无法得到更新，会一直迭代下去。
如123454630000423123125890000073341
|#

#|
(define (sqrt-iter guess x)
  (if (good-enough-quick? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough-quick? guess x)
  (< (abs (- (square guess) x)) (* 0.00001 guess)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (square x)
  (* x x))
|#

(define (sqrt-iter guess x)
  (if (good-enough-quick? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))
(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough-quick? guess new-guess)
  (< (/ (abs (- guess new-guess)) guess) 0.01))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (square x)
  (* x x))



(sqrt 11242998761234212334212)
(sqrt 0.000007)

(* 0.002669316953118858 0.002669316953118858)
