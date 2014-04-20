#lang planet neil/sicp

(define (sum-of-square x y)
  (+ (* x x) (* y y)))

;可以使用类似决策树的思考方法
(define (f a b c)
  (if (> a b) 
      (if (> b c) (sum-of-square a b) 
          (sum-of-square a c))
      (if (> a c) (sum-of-square b a)
          (sum-of-square b c))))


#|(f 1 1 1)
(f 1 1 2)
(f 2 2 1)
(f 1 2 3)
(f 3 2 1)
(f 2 1 3)
|#